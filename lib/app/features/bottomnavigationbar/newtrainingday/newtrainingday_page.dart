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
      body: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                      style: TextStyle(color: Colors.amber),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.title,
                            color: Colors.amber,
                          ),
                          hintText: 'Day name',
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)))),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
