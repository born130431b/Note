import 'package:flutter/material.dart';

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // 도움말 제목 섹션
          Row(
            children: [
              Icon(Icons.help_outline, size: 40, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                '도움말',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // 앱 사용 방법
          Text(
            '앱 사용 방법',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '1. 설정 탭에서 선수를 추가하거나 삭제합니다.\n'
            '2. 등록 탭에서 경기를 시작하고 점수를 기록합니다.\n'
            '3. 이력 탭에서 지난 경기 기록을 확인합니다.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          // FAQ 섹션
          Text(
            'FAQ (자주 묻는 질문)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Q: 선수를 어떻게 추가하나요?'),
            subtitle: Text('A: 설정 탭에서 선수 이름을 입력하고 추가 버튼을 누릅니다.'),
          ),
          ListTile(
            title: Text('Q: 점수를 수정할 수 있나요?'),
            subtitle: Text('A: 이력 탭에서 기존 경기를 선택해 점수를 수정할 수 있습니다.'),
          ),
          ListTile(
            title: Text('Q: 데이터를 초기화하려면 어떻게 하나요?'),
            subtitle: Text('A: 설정 탭에서 모든선수를, 이력탭에서 모든 기록을 삭제한 후 앱을 다시 시작합니다.'),
          ),
          SizedBox(height: 20),
          // 문의하기 섹션
          // Text(
          //   '문의하기',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 10),
          // Text(
          //   '도움이 필요하거나 제안 사항이 있으면 아래 이메일로 연락해 주세요:\n'
          //   'tjdwls1523@naver.com',
          //   style: TextStyle(fontSize: 16),
          // ),
        ],
      ),
    );
  }
}
