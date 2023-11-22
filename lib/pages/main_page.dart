import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/pages/auth_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/services/auth.dart';

import '../models/user.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserM?>(
      stream: Auth().users,
      builder: (context, snapshot) {
        // If there is authenticated user data, navigate to the Home page
        if (snapshot.hasData) {
          return Home();
        } else {
          // If no authenticated user, navigate to the Authentication page
          return const AuthPage();
        }
      },
    );
  }
}
