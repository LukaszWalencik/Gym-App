import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/app/features/bottomnavigationbar/newtrainingday/newtrainingday_page.dart';

class TrainingDays extends StatefulWidget {
  const TrainingDays({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingDays> createState() => _TrainingDaysState();
}

class _TrainingDaysState extends State<TrainingDays> {
  var daycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      padding: const EdgeInsets.all(15.0),
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
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(20),
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
                          hintText: 'Name of the day',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 10, color: Colors.red))),
                      controller: daycontroller,
                    ),
                  )
                ],
              ),
            );
          }),

      // Container(
      //   color: Colors.amber,
      //   child: ListView(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     height: 150,
      //                     width: 150,
      //                     color: Colors.grey[700],
      //                     child: Center(
      //                       child: Text(
      //                         '1dzien',
      //                         style: TextStyle(
      //                             color: Colors.amber,
      //                             fontSize: 25,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     color: Colors.grey[700],
      //                     child: SizedBox(
      //                       child: Center(
      //                           child: Text('1dzien',
      //                               style: TextStyle(
      //                                   color: Colors.amber,
      //                                   fontSize: 25,
      //                                   fontWeight: FontWeight.w600))),
      //                       height: 150,
      //                       width: 150,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
