import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/util/quizList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderUse with ChangeNotifier {
  int mark = 0;
  int index = 0;
  List marksSP = [];

  List questions = [];

  categoryChecking(dynamic recieved_category) {
    if (recieved_category == 'General Knowledge') {
      questions = general_questions;
    } else if (recieved_category == 'Science') {
      questions = science_questions;
    } else if (recieved_category == 'Technology') {
      questions = technology_questions;
    } else if (recieved_category == 'History') {
      questions = history_questions;
    }
  }

  indexAdd() {
    index++;
    notifyListeners();
  }

  addMark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('intMark', mark);
    print(prefs.getInt('intMark'));
    notifyListeners();
  }

  updateList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list', marks);
    notifyListeners();
  }

  addMarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    marksSP = await prefs.getStringList('list') ?? [];
    notifyListeners();
  }

  checking() {
    marks.add(mark.toString());
    notifyListeners();
  }

  void markFunction() {
    addMarks();
    checking();
    updateList();
    addMark();

    notifyListeners();
  }

  List<String> storedTimes=[] ;
  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');

    storedTimes = storedTimesList ?? [];
    print("$storedTimes/////////////////////////////////////////////////////////");
    notifyListeners();
  }
}













// Widget aaaa(context) {
 
//   return Column(
//     children: [
//       Consumer<ProviderUse>(
//         builder: (context,ggg,child) {
//           return TextFormField(
//             controller: ggg.contra,
//           );
//         }
//       ),
//        Consumer<ProviderUse>(
//         builder: (context,ghgg,child) {
//           return TextFormField(
//             controller: ghgg.controb,
//           );
//         }
//       ),
//         Consumer<ProviderUse>(
//         builder: (context,ghgg,child) {
//           return Text(ghgg.c.toString());
//         }
//       ),
//       Consumer<ProviderUse>(
//         builder: (context,ghgg,child) {
//           return TextButton(
//               onPressed: () {
//                 ghgg.ccf();
//               },
//               child: Text("ok"));
//         }
//       )
//     ],
//   );
// }
