import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> playerDetails = [];
  String selectedCategory = '개인 기록';

  Future<void> _loadPlayersFromFirestore() async {
    try {
      var snapshot = await _firestore
          .collection('MGT')
          .doc('KPI')
          .collection('NAME')
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> players = [];

        for (var doc in snapshot.docs) {
          Map<String, dynamic> playerData = doc.data();
          playerData['id'] = doc.id; // 문서 ID 저장 (삭제 시 사용)

          if (playerData['OUTCOME'] != null && playerData['OUTCOME'] is List) {
            List<dynamic> outcomeList = playerData['OUTCOME'];
            num totalOutcome = 0;
            num cnt = 0;

            for (var outcome in outcomeList) {
              if (outcome is num) {
                totalOutcome += outcome;
                cnt++;
              }
            }

            playerData['OUTCOME_SUM'] = (totalOutcome / cnt * 100);
            playerData['CNT'] = cnt;
          }

          if (playerData['SCORE'] != null && playerData['SCORE'] is List) {
            List<dynamic> scoreList = playerData['SCORE'];
            num totalScore = 0;
            num cnt = 0;

            for (var score in scoreList) {
              if (score is num) {
                totalScore += score;
                cnt++;
              }
            }

            playerData['SCORE_SUM'] = (totalScore / cnt);
          }

          if ((playerData['SCORE_SUM'] ?? 0) > 0) {
            players.add(playerData);
          }
        }

        players.sort((a, b) {
          num outcomeSumA = a['OUTCOME_SUM'] ?? 0;
          num outcomeSumB = b['OUTCOME_SUM'] ?? 0;
          return outcomeSumB.compareTo(outcomeSumA);
        });

        setState(() {
          playerDetails = players;
        });
      }
    } catch (e) {
      print('Error loading player details: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('선수 목록을 불러오는 중 오류가 발생했습니다.')),
      );
    }
  }

  // 기록 삭제
  Future<void> _deletePlayer(String id) async {
    try {
      await _firestore
          .collection('MGT')
          .doc('KPI')
          .collection('NAME')
          .doc(id)
          .delete();

      setState(() {
        playerDetails.removeWhere((player) => player['id'] == id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('기록이 삭제되었습니다.')),
      );
    } catch (e) {
      print('Error deleting player: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('기록을 삭제하는 중 오류가 발생했습니다.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPlayersFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: selectedCategory,
            items: [
              DropdownMenuItem(
                value: '개인 기록',
                child: Text('개인 기록'),
              ),
              DropdownMenuItem(
                value: '팀별 기록',
                child: Text('팀별 기록'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
          ),
          SizedBox(height: 16),
          Expanded(
            child: selectedCategory == '개인 기록'
                ? _buildPersonalRecords()
                : _buildTeamRecords(),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalRecords() {
    return playerDetails.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: playerDetails.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> player = playerDetails[index];
              num scoreSum = player['SCORE_SUM'] ?? 0;
              num outcomeSum = player['OUTCOME_SUM'] ?? 0;
              num totalCnt = player['CNT'] ?? 0;

              return Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              player['NAME'] ?? '이름 없음',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('승률',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                    Text('$outcomeSum%'),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text('참여 경기 수',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                    Text('$totalCnt'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deletePlayer(player['id']!);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Widget _buildTeamRecords() {
    return Center(
      child: Text(
        '팀별 기록 데이터 표시 영역',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
