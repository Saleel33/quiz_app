import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter/view/category.dart';
import 'package:quiz_app_flutter/provider/provider.dart';
import 'package:quiz_app_flutter/util/quizList.dart';
import 'package:quiz_app_flutter/view/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  ResultPage({
    super.key,
    required this.markfrom,
  });
  int markfrom;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');
  int markfromSP = 0;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    getIntValuesSF();
    storeTime();
  }

  List<String> savedDateTimes = [];

  Future<void> storeTime() async {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('yyyy-MM-dd – hh:mm').format(now.toLocal());
    final prefs = await SharedPreferences.getInstance();
    final storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(formattedDate);
    await prefs.setStringList('storedTimes', storedTimes);
  }

  var ctime;
  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    markfromSP = await prefs.getInt('intMark') ?? 0;

    print(prefs.getInt('intMark'));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderUse>(
      context,
    );
    Date_time = DateTime.now().toString();
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          DateTime now = DateTime.now();
          if (ctime == null || now.difference(ctime) > Duration(seconds: 1)) {
            //add duration of press gap
            ctime = now;
            markfromSP = 0;

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Press Back Button Again to Exit'))); //scaffold message, you can show Toast message too.
            return Future.value(false);
          }

          return Future.value(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: markfromSP >= 3
                  ? Column(
                      children: [
                        Image.asset('assets/images/pngegg.png'),
                        Text(
                          'score is $markfromSP/5',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 307,
                          height: 60,
                          margin: EdgeInsets.only(top: 50),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)))),
                              onPressed: () {
                                marks.add(markfromSP.toString());
                                markfromSP = 0;
                                provider.mark = 0;
                                provider.index = 0;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryPage()));
                              },
                              child: Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Image.asset('assets/images/lose.jpg'),
                        Text(
                          'score is $markfromSP/5',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 307,
                          height: 60,
                          margin: EdgeInsets.only(top: 100),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            onPressed: () {
                              marks.add(markfromSP.toString());
                              markfromSP = 0;
                              provider.index = 0;
                              provider.mark = 0;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryPage()));
                            },
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
