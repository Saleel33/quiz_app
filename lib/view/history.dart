import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter/provider/provider.dart';
import 'package:quiz_app_flutter/util/quizList.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  int index = 0;
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderUse>(context, listen: false).loadStoredTimes();

    return Scaffold(
        appBar: AppBar(
            title: Text('History'),
            backgroundColor: Color.fromARGB(255, 7, 57, 73)),
        body: StreamBuilder(
          stream: user.orderBy('date_time').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    // print("${document['name']}");
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 7, 57, 73), width: 5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: ListTile(
                          leading: Text(
                            'Score',
                          ),
                          title: Text(document['mark'].toString()),
                          subtitle: Text(document['date_time']),
                          trailing: Text(document['category']),
                        ),
                      ),
                    );
                  },);
            }
            return Container();
          },
        )
        // body: ListView.builder(
        //   itemCount: marks.length,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           border:
        //               Border.all(color: Color.fromARGB(255, 7, 57, 73), width: 5),
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(20),
        //         ),
        //         width: double.infinity,
        //         height: 70,
        //         child: ListTile(
        //           leading: Text(
        //             'Score',
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           title: Text("${marks[index]}"),
        //           subtitle: Consumer<ProviderUse>(
        //             builder: (context, pro, child) {
        //               return pro.storedTimes.isNotEmpty
        //                   ? Text(
        //                       '${pro.storedTimes?[index]}',
        //                     )
        //                   : Center(child: Text("data"));
        //             },
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}

String Date_time = '';
