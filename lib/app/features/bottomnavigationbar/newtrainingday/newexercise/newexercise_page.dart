import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewExercise extends StatefulWidget {
  const NewExercise({
    Key? key,
  }) : super(key: key);

  @override
  State<NewExercise> createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {
  final exercisecontroller = TextEditingController();
  final commentcontroller = TextEditingController();
  final weightcontroller = TextEditingController();

  var musclepartlist = 'Back';
  var setnumber = '1';
  var repsnumber = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: const Text(
          'New Exercise',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Text('Muscle part:', style: TextStyle(fontSize: 20)),
              DropdownButton<String>(
                value: musclepartlist,
                onChanged: (String? pickmuscle) {
                  setState(() {
                    musclepartlist = pickmuscle!;
                  });
                },
                items: <String>[
                  'Legs',
                  'Back',
                  'Chest',
                  'Schoulders',
                  'Biceps',
                  'Triceps',
                  'Forearms',
                  'Stomach'
                ].map<DropdownMenuItem<String>>((String musclepart) {
                  return DropdownMenuItem<String>(
                    value: musclepart,
                    child: Text(musclepart),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Exercise:', style: TextStyle(fontSize: 20)),
              TextField(
                style: const TextStyle(
                  fontSize: (20),
                ),
                controller: exercisecontroller,
                decoration: InputDecoration(
                  hintText: 'Name of exercise',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ),
              const Text('Sets:', style: TextStyle(fontSize: 20)),
              DropdownButton<String>(
                value: setnumber,
                onChanged: (String? picksets) {
                  setState(() {
                    setnumber = picksets!;
                  });
                },
                items:
                    List.generate(20, (int index) => ((index + 1)).toString())
                        .map<DropdownMenuItem<String>>((String sets) {
                  return DropdownMenuItem<String>(
                    value: sets,
                    child: Text(sets),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Reps:', style: TextStyle(fontSize: 20)),
              DropdownButton<String>(
                value: repsnumber,
                onChanged: (String? pickreps) {
                  setState(() {
                    repsnumber = pickreps!;
                  });
                },
                items:
                    List.generate(20, (int index) => ((index + 1)).toString())
                        .map<DropdownMenuItem<String>>((String reps) {
                  return DropdownMenuItem<String>(
                    value: reps,
                    child: Text(reps),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Weight:', style: TextStyle(fontSize: 20)),
              TextField(
                style: const TextStyle(
                  fontSize: (20),
                ),
                controller: weightcontroller,
                decoration: InputDecoration(
                  hintText: 'Write weight used to exercise',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Comment:', style: TextStyle(fontSize: 20)),
              TextField(
                style: const TextStyle(
                  fontSize: (20),
                ),
                controller: commentcontroller,
                decoration: InputDecoration(
                  hintText: 'Add comment here',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  FirebaseFirestore.instance.collection('exerciseday').add({
                    'comment': commentcontroller.text,
                    'exercisename': exercisecontroller.text,
                    'muslepart': musclepartlist,
                    'reps': repsnumber,
                    'sets': setnumber,
                    'weight': weightcontroller.text,
                  });
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Add this exercise"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700], // background color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
