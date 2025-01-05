import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class ScoreboardTab extends StatefulWidget {
  @override
  _ScoreboardTabState createState() => _ScoreboardTabState();
}

class _ScoreboardTabState extends State<ScoreboardTab> {
  int matchPlayers = 1; // 매치에 참여할 인원 수
  int matchCount = 1; // 세트 수
  List<String> playerNames = []; // Firestore에서 가져온 선수들 리스트
  TextEditingController leftTeamScoreController = TextEditingController();
  TextEditingController rightTeamScoreController = TextEditingController();
  Map<String, int> scores = {'left': 0, 'right': 0}; // 점수 저장 맵

  List<String?> selectedLeftPlayers = [];
  List<String?> selectedRightPlayers = [];

  List<bool> leftTeamWins = []; // 왼쪽 팀의 승/패 상태
  List<bool> rightTeamWins = []; // 오른쪽 팀의 승/패 상태

  @override
  void initState() {
    super.initState();
    _loadScores();
    _updateMatchPlayers(matchPlayers); // 초기 인원 설정
    _updateMatchCount(matchCount); // 초기 세트 설정
    _loadPlayersFromFirebase(); // Firebase에서 선수들 불러오기
  }

  // 사용자 기기 UUID 또는 Device ID 가져오기
  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      var iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!;
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      var androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Android device ID
    }

    return deviceId; // 기기 고유 ID 반환
  }

  // Firestore에서 선수 이름 불러오기 (중복 제거)
  void _loadPlayersFromFirebase() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot =
        await firestore.collection('MGT').doc('PLAYER').get(); // PLAYER 문서 가져오기

    if (documentSnapshot.exists) {
      List<dynamic> names = documentSnapshot['names'] ?? [];
      setState(() {
        playerNames =
            List<String>.from(Set<String>.from(names)); // 중복 제거 후 리스트 저장
      });
    } else {
      print("Player data not found");
    }
  }

  // 매치 인원수 변경 시 팀 선수 초기화
  void _updateMatchPlayers(int newValue) {
    setState(() {
      matchPlayers = newValue;
      selectedLeftPlayers = List.filled(newValue, null, growable: false);
      selectedRightPlayers = List.filled(newValue, null, growable: false);
    });
  }

  // 매치 인원수 변경 시 팀 선수 초기화
  void _updateMatchCount(int newValue) {
    setState(() {
      matchCount = newValue;
      leftTeamWins = List.filled(newValue, false, growable: false);
      rightTeamWins = List.filled(newValue, false, growable: false);
    });
  }

  // 점수 저장 함수
  void _saveScores() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uuid = Uuid().v4();

    // 선수 선택이 완료되지 않았으면 에러 처리
    if (selectedLeftPlayers.contains(null) ||
        selectedRightPlayers.contains(null)) {
      _showErrorDialog('모든 선수들을 선택해주세요!');
      return;
    }

    // 모든 세트의 결과를 숫자로 변환 (A팀)
    List<int> outcomeLeft = List.generate(matchCount, (index) {
      if (leftTeamWins[index]) return 1; // 승
      if (rightTeamWins[index]) return 0; // 패
      return 0; // 무승부
    });

    // 모든 세트의 결과를 숫자로 변환 (B팀)
    List<int> outcomeRight = List.generate(matchCount, (index) {
      if (rightTeamWins[index]) return 1; // 승
      if (leftTeamWins[index]) return 0; // 패
      return 0; // 무승부
    });

    // A조 선수 저장
    for (int i = 0; i < selectedLeftPlayers.length; i++) {
      String? playerName = selectedLeftPlayers[i];
      // (MGT -> KPI -> NAME)
      if (playerName != null) {
        DocumentSnapshot playerDoc = await firestore
            .collection('MGT')
            .doc('KPI')
            .collection('NAME')
            .doc(playerName)
            .get();

        List<int> currentOutcomes = [];
        if (playerDoc.exists && playerDoc.data() != null) {
          currentOutcomes = List<int>.from(playerDoc['OUTCOME'] ?? []);
        }

        // outcomes 배열을 기존 데이터에 추가
        currentOutcomes.addAll(outcomeLeft); // 기존 값에 추가

        await firestore
            .collection('MGT')
            .doc('KPI')
            .collection('NAME')
            .doc(playerName)
            .set({
          'NAME': playerName,
          'OUTCOME': currentOutcomes, // 세트 결과 저장
          'CREATED_AT': Timestamp.now(), // 저장 시간
          'CREATED_USER': await prefs.getString('userId'), // 저장 아이디
          'CREATED_IP': await getDeviceId(), // 저장 IP
        });
      }
      // (MGT -> KPI -> TEAMS)
      if (playerName != null && (i + 1) == selectedLeftPlayers.length) {
        await firestore.collection('MGT').doc('KPI').collection('TEAMS').add({
          'CREATED_AT': Timestamp.now(), // 저장 시간
          'CREATED_IP': await getDeviceId(), // 저장 IP
          'CREATED_USER': await prefs.getString('userId'), // 저장 ID
          'MATCH_COUNT': outcomeLeft, // 세트 수 저장
          'PLAYER_NAME': selectedLeftPlayers,
          'SN': uuid, // SN 저장
          'TEAM': 'A', // 팀 저장
        });
      }
    }

    // B조 선수 저장
    for (int i = 0; i < selectedRightPlayers.length; i++) {
      String? playerName = selectedRightPlayers[i];
      if (playerName != null) {
        DocumentSnapshot playerDoc = await firestore
            .collection('MGT')
            .doc('KPI')
            .collection('NAME')
            .doc(playerName)
            .get();

        List<int> currentOutcomes = [];
        if (playerDoc.exists && playerDoc.data() != null) {
          currentOutcomes = List<int>.from(playerDoc['OUTCOME'] ?? []);
        }

        // outcomes 배열을 기존 데이터에 추가
        currentOutcomes.addAll(outcomeRight); // 기존 값에 추가

        await firestore
            .collection('MGT')
            .doc('KPI')
            .collection('NAME')
            .doc(playerName)
            .set({
          'NAME': playerName,
          'OUTCOME': currentOutcomes, // 세트 결과 저장
          'CREATED_AT': Timestamp.now(), // 저장 시간
          'CREATED_USER': await prefs.getString('userId'), // 저장한 ID
          'CREATED_IP': await getDeviceId(), // 기기ID
        });
      }
      // (MGT -> KPI -> TEAMS)
      if (playerName != null && (i + 1) == selectedRightPlayers.length) {
        await firestore.collection('MGT').doc('KPI').collection('TEAMS').add({
          'CREATED_AT': Timestamp.now(), // 저장 시간
          'CREATED_IP': await getDeviceId(), // 세트 결과 저장
          'CREATED_USER': await prefs.getString('userId'), // 세트 결과 저장
          'MATCH_COUNT': outcomeRight, // 세트 수 저장
          'PLAYER_NAME': selectedRightPlayers,
          'SN': uuid, // SN 저장
          'TEAM': 'B', // 팀 저장
        });
      }
    }

    // 저장 성공 메시지 출력
    _showSaveSuccessDialog();
  }

  // 오류 메시지 다이얼로그 표시
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('입력 오류'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 점수 저장 완료 팝업
  void _showSaveSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('저장 완료'),
          content: Text('점수가 성공적으로 저장되었습니다!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 저장된 점수 불러오기
  void _loadScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int leftScore = prefs.getInt('leftScore') ?? 0;
    int rightScore = prefs.getInt('rightScore') ?? 0;

    setState(() {
      scores['left'] = leftScore;
      scores['right'] = rightScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 선택된 선수 목록
    Set<String?> selectedPlayers = {
      ...selectedLeftPlayers.where((p) => p != null),
      ...selectedRightPlayers.where((p) => p != null)
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 텍스트들을 가로로 중앙 정렬
                children: [
                  Text(
                    '인원수 선택',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 90),
                  Text(
                    '세트 선택',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 텍스트들을 가로로 중앙 정렬
                children: [
                  DropdownButton<int>(
                    value: matchPlayers,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        _updateMatchPlayers(newValue);
                      }
                    },
                    items: [1, 2, 3].map((int players) {
                      return DropdownMenuItem<int>(
                        value: players,
                        child: Text('$players 대 $players 매치'),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 80),
                  DropdownButton<int>(
                    value: matchCount,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        _updateMatchCount(newValue);
                      }
                    },
                    items: [1, 2, 3, 4, 5].map((int matchCnt) {
                      return DropdownMenuItem<int>(
                        value: matchCnt,
                        child: Text('$matchCnt 세트'),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Row 내의 요소들을 중앙에 배치
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A조 선택',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 120),
                      ...List.generate(matchPlayers, (index) {
                        List<String> availableLeftPlayers = playerNames
                            .where((player) =>
                                !selectedPlayers.contains(player) ||
                                selectedLeftPlayers[index] == player)
                            .toList();
                        return DropdownButton<String>(
                          value: selectedLeftPlayers[index],
                          hint: Text('선수 선택'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedLeftPlayers[index] = newValue;
                            });
                          },
                          items: availableLeftPlayers.map((String player) {
                            return DropdownMenuItem<String>(
                              value: player,
                              child: Text(player),
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                  SizedBox(width: 38),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'B조 선택',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 80),
                      ...List.generate(matchPlayers, (index) {
                        List<String> availableRightPlayers = playerNames
                            .where((player) =>
                                !selectedPlayers.contains(player) ||
                                selectedRightPlayers[index] == player)
                            .toList();
                        return DropdownButton<String>(
                          value: selectedRightPlayers[index],
                          hint: Text('선수 선택'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedRightPlayers[index] = newValue;
                            });
                          },
                          items: availableRightPlayers.map((String player) {
                            return DropdownMenuItem<String>(
                              value: player,
                              child: Text(player),
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                '승리팀 입력',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // 버튼을 왼쪽으로 정렬
                      children: [
                        ...List.generate(matchCount, (index) {
                          return Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // 버튼과 텍스트를 가로로 중앙 정렬
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    leftTeamWins[index] = !leftTeamWins[index];
                                    if (leftTeamWins[index]) {
                                      rightTeamWins[index] = false;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: leftTeamWins[index]
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      leftTeamWins[index]
                                          ? '승'
                                          : (rightTeamWins[index]
                                              ? '패'
                                              : '무승부'),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10, height: 50), // 버튼 간의 간격
                              Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center, // 텍스트를 중앙 정렬
                                child: Text('${index + 1} 세트',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(width: 10), // 버튼 간의 간격
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    rightTeamWins[index] =
                                        !rightTeamWins[index];
                                    if (rightTeamWins[index]) {
                                      leftTeamWins[index] = false;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: rightTeamWins[index]
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      rightTeamWins[index]
                                          ? '승'
                                          : (leftTeamWins[index] ? '패' : '무승부'),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveScores,
              child: Text('점수 저장'),
            ),
          ],
        ),
      ),
    );
  }
}
