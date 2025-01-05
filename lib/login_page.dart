import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pingpong_score_page.dart'; // 점수 화면 임포트
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Firestore 인스턴스

  bool _isUsernameSaved = false;

  @override
  void initState() {
    super.initState();
    _loadLoginData(); // 앱이 시작될 때 아이디 상태 불러오기
  }

  // SharedPreferences에서 저장된 로그인 데이터 불러오기
  void _loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isUsernameSaved = prefs.getBool('isUsernameSaved') ?? false;
      if (_isUsernameSaved) {
        _usernameController.text = prefs.getString('savedUsername') ?? '';
      }
    });
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

  // Firestore에서 사용자 문서 검색
  Future<DocumentSnapshot?> _getUser(String username) async {
    try {
      return await _firestore
          .collection('MGT')
          .doc('USER')
          .collection('ACCOUNTS')
          .doc(username)
          .get();
    } catch (e) {
      print('사용자 검색 실패: $e');
      return null;
    }
  }

  // 전화번호로 사용자 검색
  Future<DocumentSnapshot?> _getUserByPhone(String? phone) async {
    try {
      if (phone != null && phone.isNotEmpty) {
        // 전화번호로 사용자 검색
        return await _firestore
            .collection('MGT')
            .doc('USER')
            .collection('ACCOUNTS')
            .where('contact', isEqualTo: phone)
            .limit(1)
            .get()
            .then((querySnapshot) => querySnapshot.docs.isNotEmpty
                ? querySnapshot.docs.first
                : null);
      }
      return null;
    } catch (e) {
      print('전화번호로 사용자 검색 실패: $e');
      return null;
    }
  }

  // 로그인 함수
  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      DocumentSnapshot? userDoc = await _getUser(username);

      if (userDoc != null && userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        if (userData['PW'] == password) {
          // 로그인 성공 시 아이디 상태 저장
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isUsernameSaved', _isUsernameSaved);
          prefs.setString('savedUsername', _usernameController.text.trim());
          prefs.setString('userId', userData['ID']);

          print('로그인 성공 : ' + userData['ID']);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PingpongScorePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('비밀번호가 잘못되었습니다.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('존재하지 않는 사용자입니다.')),
        );
      }
    }
  }

  // 회원가입 함수
  void _signUp() {
    final _signupFormKey = GlobalKey<FormState>();
    final _signupUsernameController = TextEditingController();
    final _signupPasswordController = TextEditingController();
    final _signupPhoneController = TextEditingController();
    final _signupHintController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('회원가입'),
        content: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 아이디 입력 필드
                TextFormField(
                  controller: _signupUsernameController,
                  decoration: InputDecoration(labelText: '아이디'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '아이디를 입력해주세요.';
                    }
                    return null;
                  },
                ),
                // 비밀번호 입력 필드
                TextFormField(
                  controller: _signupPasswordController,
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
                // 연락처 입력 필드 (선택)
                TextFormField(
                  controller: _signupPhoneController,
                  decoration: InputDecoration(labelText: '연락처 (선택 - 아이디 찾기)'),
                  keyboardType: TextInputType.number,
                  maxLength: 11, // 전화번호는 최대 11자리
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length != 11) {
                        return '전화번호는 11자리여야 합니다.';
                      }
                      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return '전화번호는 숫자만 입력 가능합니다.';
                      }
                    }
                    return null;
                  },
                ), // 비밀번호 찾기 힌트 입력 필드
                TextFormField(
                  controller: _signupHintController,
                  decoration: InputDecoration(labelText: '비밀번호 찾기 힌트'),
                  maxLength: 50, // 최대 50자 제한
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호 찾기 힌트를 입력해주세요.';
                    }
                    if (value.length > 50) {
                      return '힌트는 최대 50자 이내여야 합니다.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_signupFormKey.currentState?.validate() ?? false) {
                String username = _signupUsernameController.text.trim();
                String password = _signupPasswordController.text.trim();
                String? contact = _signupPhoneController.text.trim();
                String hint = _signupHintController.text.trim();

                // 아이디 중복 검사
                DocumentSnapshot? existingUser = await _getUser(username);
                // 전화번호 중복 검사
                DocumentSnapshot? existingUserByPhone =
                    await _getUserByPhone(contact);

                if (existingUser != null && existingUser.exists) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('이미 존재하는 아이디입니다.')),
                  );
                } else if (existingUserByPhone != null &&
                    existingUserByPhone.exists) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('이미 존재하는 전화번호입니다.')),
                  );
                } else {
                  try {
                    // Firestore에 새 사용자 저장
                    await _firestore
                        .collection('MGT')
                        .doc('USER')
                        .collection('ACCOUNTS')
                        .doc(username)
                        .set({
                      'ID': username,
                      'PW': password,
                      'CONTACT':
                          contact.isNotEmpty ? contact : '', // 연락처는 선택 입력
                      'PWH': hint, // 비밀번호 찾기 힌트
                      'CREATED_AT': Timestamp.now(),
                      'CREATED_USER': username,
                      'CREATED_IP': await getDeviceId(),
                    });

                    print('회원가입 성공');
                    Navigator.pop(context); // 팝업 닫기
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('회원가입 성공: $username')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('회원가입 실패: $e')),
                    );
                  }
                }
              }
            },
            child: Text('가입하기'),
          ),
        ],
      ),
    );
  }

  // 아이디 찾기
  void _FindOutID() {
    final _signupFormKey = GlobalKey<FormState>();
    final _signupPhoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('아이디 찾기'),
        content: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 연락처 입력 필드
                TextFormField(
                  controller: _signupPhoneController,
                  decoration: InputDecoration(labelText: '연락처'),
                  keyboardType: TextInputType.number,
                  maxLength: 11, // 전화번호는 최대 11자리
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length != 11) {
                        return '전화번호는 11자리여야 합니다.';
                      }
                      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return '전화번호는 숫자만 입력 가능합니다.';
                      }
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_signupFormKey.currentState?.validate() ?? false) {
                String? contact = _signupPhoneController.text.trim();

                // 전화번호 확인
                DocumentSnapshot? existingUserByPhone =
                    await _getUserByPhone(contact);

                if (existingUserByPhone != null && existingUserByPhone.exists) {
                  // 아이디 찾기
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('회원님의 아이디는 \'' +
                            existingUserByPhone.get('ID') +
                            '\'입니다.')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('등록된 전화번호가 없습니다.')),
                  );
                }
              }
            },
            child: Text('아이디찾기'),
          ),
        ],
      ),
    );
  }

  // 비밀번호 힌트 찾기
  void _FindOutPW() {
    final _signupFormKey = GlobalKey<FormState>();
    final _signupPhoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('힌트 찾기'),
        content: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 연락처 입력 필드
                TextFormField(
                  controller: _signupPhoneController,
                  decoration: InputDecoration(labelText: '연락처'),
                  keyboardType: TextInputType.number,
                  maxLength: 11, // 전화번호는 최대 11자리
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length != 11) {
                        return '전화번호는 11자리여야 합니다.';
                      }
                      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return '전화번호는 숫자만 입력 가능합니다.';
                      }
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_signupFormKey.currentState?.validate() ?? false) {
                String? contact = _signupPhoneController.text.trim();

                // 전화번호 확인
                DocumentSnapshot? existingUserByPhone =
                    await _getUserByPhone(contact);

                if (existingUserByPhone != null && existingUserByPhone.exists) {
                  // 비밀번호 힌트 찾기
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('회원님의 비밀번호 힌트는 \'' +
                            existingUserByPhone.get('PWH') +
                            '\'입니다.')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('등록된 전화번호가 없습니다.')),
                  );
                }
              }
            },
            child: Text('비밀번호 힌트'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '아이디'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력해주세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: '비밀번호'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("아이디 저장"),
                      Checkbox(
                        value: _isUsernameSaved,
                        onChanged: (bool? value) {
                          setState(() {
                            _isUsernameSaved = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () => _FindOutID(), child: Text('아이디 찾기')),
                  TextButton(
                      onPressed: () => _FindOutPW(), child: Text('비밀번호 찾기')),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('로그인'),
              ),
              TextButton(onPressed: () => _signUp(), child: Text('회원가입'))
            ],
          ),
        ),
      ),
    );
  }
}
