import 'package:flutter/material.dart';
import 'package:gymapp/app/bottomnavigationbar/newexercise/newexercise_page.dart';

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
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.grey[700],
                //   ),
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   icon: Icon(Icons.arrow_back),
                //   label: Text('Return'),
                // ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const NewExercise(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text("Add Exercise"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700], // background color
                  ),
                ),
              ],
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
