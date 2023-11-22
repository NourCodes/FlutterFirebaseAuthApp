import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/pages/login_page.dart';
import 'package:flutter_auth/pages/registration_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;
  toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(showRegisterPage: toggleScreen);
    } else {
      return RegistrationPage(showLoginPage: toggleScreen);
    }
  }
}
