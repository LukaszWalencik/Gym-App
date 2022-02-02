import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/app/features/bottomnavigationbar/newtrainingday/newexercise/newexercise_page.dart';

class NewTrainingDay extends StatelessWidget {
  const NewTrainingDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done))],
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: const Text(
          'Create Training Day',
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NewExercise(),
              ),
            );
          }),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('exerciseday').snapshots(),
          builder: (context, snapshot) {
            final documents = snapshot.data!.docs;
            return Container(
              color: Colors.amber,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Add an exercise using a plus button',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        for (final document in documents) ...[
                          Dismissible(
                            key: ValueKey(document.id),
                            onDismissed: (_) {
                              FirebaseFirestore.instance
                                  .collection('exerciseday')
                                  .doc(document.id)
                                  .delete();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                color: Colors.grey[700],
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Musclepart:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['muslepart'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Exercise name:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['exercisename'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Reps:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['reps'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Sets:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['sets'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Weight:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['weight'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Comment:  ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                        Text(document['comment'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.amber)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }),
    );
  }
}
