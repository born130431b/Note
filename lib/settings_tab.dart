import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsTab extends StatefulWidget {
  final List<String> playerNames;
  final Function(String) addPlayerName;
  final Function(String) removePlayerName;

  SettingsTab({
    required this.addPlayerName,
    required this.removePlayerName,
    required this.playerNames,
  });

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final TextEditingController _nameController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 선수 추가 함수
  void _handleAddPlayer() async {
    String playerName = _nameController.text.trim();
    if (playerName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('선수 이름을 입력해주세요.')),
      );
      return;
    }

    // Firestore에서 이미 해당 선수 이름이 있는지 확인
    var snapshot = await _firestore.collection('MGT').doc('PLAYER').get();
    if (snapshot.exists) {
      List<String> existingPlayers = List<String>.from(snapshot['names'] ?? []);
      if (existingPlayers.contains(playerName)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미 등록된 선수입니다.')),
        );
        return; // 중복된 선수는 추가하지 않음
      }
    }

    // Firestore에 선수 이름을 PLAYER 문서의 names 배열에 추가
    await _firestore.collection('MGT').doc('PLAYER').update({
      'names': FieldValue.arrayUnion([playerName]),
    });

    // 선수 목록 업데이트
    widget.addPlayerName(playerName);
    _nameController.clear();
  }

  // 선수 삭제 함수
  void _confirmRemovePlayer(String playerName) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('선수 삭제'),
        content: Text('$playerName 선수를 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              // Firestore에서 선수 이름 삭제
              await _firestore.collection('MGT').doc('PLAYER').update({
                'names': FieldValue.arrayRemove([playerName]),
              });

              widget.removePlayerName(playerName);
              Navigator.pop(context);
            },
            child: Text('삭제'),
          ),
        ],
      ),
    );
  }

  // 선수 목록 로드 함수
  Future<void> _loadPlayersFromFirestore() async {
    var snapshot = await _firestore.collection('MGT').doc('PLAYER').get();
    if (snapshot.exists) {
      List<String> players = List<String>.from(snapshot['names'] ?? []);
      setState(() {
        widget.playerNames.clear();
        widget.playerNames.addAll(players);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPlayersFromFirestore(); // Firestore에서 선수 데이터 불러오기
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: '선수 이름 입력',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _handleAddPlayer,
            icon: Icon(Icons.add),
            label: Text('선수 추가'),
          ),
          SizedBox(height: 16),
          Text(
            '등록된 선수:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.playerNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    widget.playerNames[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        _confirmRemovePlayer(widget.playerNames[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
