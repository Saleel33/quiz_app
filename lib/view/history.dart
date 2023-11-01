import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter/provider/provider.dart';
import 'package:quiz_app_flutter/util/quizList.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  int index = 0;



  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderUse>(context).loadStoredTimes();
    return Scaffold(
      appBar: AppBar(
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         prefsClear();
          //       },
          //       icon: Icon(Icons.clear_all))
          // ],
          title: Text('History'),
          backgroundColor: Color.fromARGB(255, 7, 57, 73)),
      body: ListView.builder(
        itemCount: marks.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Color.fromARGB(255, 7, 57, 73), width: 5),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 70,
              child: ListTile(
                leading: Text(
                  'Score',
                  style: TextStyle(fontSize: 20),
                ),
                title: Text("${marks[index]}"),
                subtitle: Consumer<ProviderUse>(builder: (context, pro, child) {
                  return Text(
                    '${pro.storedTimes[index]}',
                  );
                },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
