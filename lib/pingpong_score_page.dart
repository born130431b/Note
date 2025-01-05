import 'package:flutter/material.dart';
import 'scoreboard_tab.dart';
import 'settings_tab.dart';
import 'help_tab.dart';
import 'history_tab.dart'; // Empty Tab
import 'login_page.dart'; // 로그인 페이지 임포트

class PingpongScorePage extends StatefulWidget {
  @override
  _PingpongScorePageState createState() => _PingpongScorePageState();
}

class _PingpongScorePageState extends State<PingpongScorePage> {
  // 선수 이름을 저장할 리스트
  List<String> playerNames = [];

  // 뒤로 가기 버튼을 눌렀을 때, 로그아웃 확인 팝업을 띄움
  Future<bool> _onWillPop() async {
    bool? exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그아웃'),
          content: Text('로그아웃 하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // '아니오'를 눌렀을 때 아무 동작 안 함
              },
              child: Text('아니오'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // '예'를 눌렀을 때 로그인 페이지로 돌아감
              },
              child: Text('예'),
            ),
          ],
        );
      },
    );
    if (exitApp ?? false) {
      // '예'를 눌렀을 때 로그인 페이지로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
    return exitApp ?? false;
  }

  // 선수 이름 추가 함수
  void _addPlayerName(String name) {
    setState(() {
      playerNames.add(name);
    });
  }

  // 선수 이름 삭제 함수
  void _removePlayerName(String name) {
    setState(() {
      playerNames.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // 뒤로 가기 처리
      child: DefaultTabController(
        length: 4, // 4개의 탭
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pingpong Score Tracker'),
            bottom: TabBar(
              tabs: [
                Tab(text: '등록'),
                Tab(text: '이력'), // History 탭 그대로 유지
                Tab(text: '설정'),
                Tab(text: '정보'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ScoreboardTab(), // ScoreboardTab 사용
              HistoryTab(), // HistoryTab 사용
              SettingsTab(
                addPlayerName: _addPlayerName,
                removePlayerName: _removePlayerName,
                playerNames: playerNames,
              ),
              HelpTab(),
            ],
          ),
        ),
      ),
    );
  }
}
