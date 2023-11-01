import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/view/category.dart';
import 'package:quiz_app_flutter/view/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/quiz.png'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 55,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    filled: true,
                    fillColor: Color.fromARGB(255, 144, 199, 245),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white70)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 55,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color.fromARGB(255, 144, 199, 245),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white70)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)))),
                  onPressed: () {
                    loginCheck(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                  onPressed: () {
                    loginCheck(context);
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void loginCheck(BuildContext context) async {
    if (_usernameController.text == "saleel" &&
        _passwordController.text == "12345") {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(savedName, true);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CategoryPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Invalid username or password',
          style: TextStyle(fontSize: 20),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
      ));
    }
  }
}
