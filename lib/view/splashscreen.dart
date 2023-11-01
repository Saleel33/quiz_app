import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/view/category.dart';
import 'package:quiz_app_flutter/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

const savedName = 'CheckUserLogedin';

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/playstore.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Future<void> Login() async {
    await Future.delayed(Duration(seconds: 6));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Future<void> checkLogin() async {
    final preferences = await SharedPreferences.getInstance();
    final userLogedin = preferences.getBool(savedName);

    if (userLogedin == null || userLogedin == false) {
      Login();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CategoryPage()));
    }
  }
}
