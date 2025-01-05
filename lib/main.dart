import 'package:flutter/material.dart';
import 'login_page.dart'; // 로그인 화면 임포트
import 'package:firebase_core/firebase_core.dart'; // Firebase 초기화 패키지
import 'firebase_options.dart'; // 자동 생성된 Firebase 옵션 파일

void main() async {
  // WidgetsFlutterBinding를 초기화하여 비동기 작업을 허용
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 옵션 설정
  );

  // 애플리케이션 시작
  runApp(PingpongScoreApp());
}

class PingpongScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pingpong Score Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // 로그인 페이지 시작
    );
  }
}
