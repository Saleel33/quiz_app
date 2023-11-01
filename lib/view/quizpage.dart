//quiz page for showing quiz and options user to select the answer

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_flutter/provider/provider.dart';
import 'package:quiz_app_flutter/view/resultpage.dart';

// ignore: must_be_immutable
class QuizPage extends StatelessWidget {
  var category;

  QuizPage({super.key, this.category});

 
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderUse>(context).categoryChecking(category);
    final provider = Provider.of<ProviderUse>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 57, 73),
        title: Text('Question Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 7, 57, 73),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  provider.questions[provider.index].question!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (provider.questions[provider.index].indexOfAnswer == 0) {
                      provider.mark++;
                    }

                    print(provider.mark);
                    print('mark');
                    if (provider.index != 4) {
                      provider.indexAdd();
                    } else {
                      provider.markFunction();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage(
                            markfrom: provider.mark,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange.shade300),
                    child: Center(
                      child: Text(
                        provider.questions[provider.index].options![0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (provider.questions[provider.index].indexOfAnswer == 1) {
                      provider.mark++;
                    }

                    print(provider.mark);
                    print('mark');
                    if (provider.index != 4) {
                      provider.indexAdd();
                    } else {
                      provider.markFunction();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage(
                            markfrom: provider.mark,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange.shade300),
                    child: Center(
                      child: Text(
                        provider.questions[provider.index].options![1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (provider.questions[provider.index].indexOfAnswer == 2) {
                      provider.mark++;
                    }

                    print(provider.mark);
                    print('mark');
                    if (provider.index != 4) {
                      provider.indexAdd();
                    } else {
                      provider.markFunction();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage(
                            markfrom: provider.mark,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.orange.shade300,
                    ),
                    child: Center(
                      child: Text(
                        provider.questions[provider.index].options![2],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (provider.questions[provider.index].indexOfAnswer == 3) {
                      provider.mark++;
                    }

                    print(provider.mark);
                    print('mark');
                    if (provider.index != 4) {
                      provider.indexAdd();
                    } else {
                      provider.markFunction();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage(
                            markfrom: provider.mark,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange.shade300),
                    child: Center(
                      child: Text(
                        provider.questions[provider.index].options![3],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
