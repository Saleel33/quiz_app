import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/functions.dart';
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
    Login(context);

    super.initState();
  }

  Functions obj = Functions();

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

//   void loginCheck(BuildContext context) async {
//     UserCredential? userCredential = await obj.signInWithGoogle();
//     StreamBuilder(
//       stream: userCredential.,
//     );

//     print(
//         "///////////////////////////////////${userCredential} /////////////////////////////////////////////////////////////////////");
//     if (userCredential != false) {
//       final _sharedPrefs = await SharedPreferences.getInstance();
//       await _sharedPrefs.setBool(savedName, true);

//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => CategoryPage()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//           'Invalid username or password',
//           style: TextStyle(fontSize: 17),
//         ),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.red,
//         margin: EdgeInsets.all(10),
//       ));
//     }
//   }
// }

  Future<void> Login(context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

// Future<void> checkLogin(context) async {
//   final preferences = await SharedPreferences.getInstance();
//   final userLogedin = preferences.getBool(savedName);

//   if (userLogedin == null || userLogedin == false) {
//     Login(context);
//   } else {
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => CategoryPage()));
//   }
// }
}
