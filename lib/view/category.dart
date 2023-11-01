import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/view/history.dart';
import 'package:quiz_app_flutter/view/homepage.dart';
import 'package:quiz_app_flutter/view/quizpage.dart';
import 'package:quiz_app_flutter/util/quizList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

prefsClear() async {
  final prefrs = await SharedPreferences.getInstance();
  prefrs.clear();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    getIntValuesSF();
    markTransfer();
    totalMark();
  }

  CategoryPage obj = CategoryPage();
  markTransfer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    marks = await prefs.getStringList('list') ?? [];
  }

  int? markfromSP;
  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    markfromSP = await prefs.getInt('intMark') ?? 0;

  }

  totalMark() {
    int i;
    int totalMarks = 0;
    for (i = 0; i < marks.length; i++) {
      totalMarks = totalMarks + int.parse(marks[i]);
    }
    return (totalMarks.toString());
  }



  @override
  Widget build(BuildContext context) {
    // totalMark();
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Mohammed Saleel'),
              accountEmail: Text('Saleel0005@gmail'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/pngegg (1).png'),
              ),
              decoration: BoxDecoration(color: Color.fromARGB(255, 7, 57, 73)),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                prefsClear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Color.fromARGB(255, 7, 57, 73),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HistoryPage()));
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FittedBox(
                        child: Icon(
                      Icons.history,
                      size: 50,
                      color: Colors.white,
                    )),
                  ),
                ),
                Container(
                  child: Text(
                    'Quiz App',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
               
                    print('Hi saleel');
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/images/pngegg (1).png')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: InkWell(
              onTap: () {
                print('on pressed');
              },
              child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('Current\nScore',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 7, 57, 73))),
                      ),
                      Container(
                        child: Text(markfromSP.toString(),
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 7, 57, 73))),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color.fromARGB(255, 7, 57, 73),
                      ),
                      Container(
                        child: Text('Total \nScore',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 7, 57, 73))),
                      ),
                      Container(
                        child: Text(totalMark(),
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(255, 7, 57, 73))),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(13),
                child: InkWell(
                  onTap: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizPage(category: names[index])));
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Color.fromARGB(255, 7, 57, 73),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset(
                          images[index],
                          cacheHeight: 50,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          names[index],
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
