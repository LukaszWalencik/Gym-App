import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/app/features/home_page/home_page_content.dart';
import 'package:gymapp/app/features/bottomnavigationbar/account_page/account_page_content.dart';
import 'package:gymapp/app/features/bottomnavigationbar/newtrainingday/newtrainingday_page.dart';

class TrainingDays extends StatefulWidget {
  const TrainingDays({
    required this.email,
    required this.user,
    Key? key,
  }) : super(key: key);
  final String? email;
  final User user;
  @override
  State<TrainingDays> createState() => _TrainingDaysState();
}

class _TrainingDaysState extends State<TrainingDays> {
  var daycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AccountPage(email: widget.user.email),
                  ),
                );
              },
              icon: Icon(Icons.person))
        ],
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Training Days',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        hoverColor: Colors.black,
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.amber,
        splashColor: Colors.black,
        onPressed: () {
          final dayname = daycontroller;
          FirebaseFirestore.instance.collection('day').add({
            'number': dayname.text,
          });
          daycontroller.clear();
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('day').snapshots(),
          builder: (context, snapshot) {
            final documents = snapshot.data!.docs;
            return Container(
              color: Colors.amber,
              child: ListView(
                children: [
                  for (final document in documents) ...[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Dismissible(
                        key: ValueKey(document.id),
                        onDismissed: (_) {
                          FirebaseFirestore.instance
                              .collection('day')
                              .doc(document.id)
                              .delete();
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => NewTrainingDay()));
                          },
                          child: Container(
                            height: 80,
                            width: 100,
                            color: Colors.grey[700],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(document['number'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.amber)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //   ],
                      // ),
                    ),
                  ],
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black38,
                        hintText:
                            'Write name of the training day and click add',
                        hintStyle: TextStyle(fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      controller: daycontroller,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
