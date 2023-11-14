import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter/firebase_options.dart';
import 'package:quiz_app_flutter/provider/provider.dart';
import 'package:quiz_app_flutter/view/category.dart';
import 'package:quiz_app_flutter/view/homepage.dart';
import 'package:quiz_app_flutter/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProviderUse(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return CategoryPage();
                  } else {
                  return  HomePage();
                  }
                }))));
  }
}
