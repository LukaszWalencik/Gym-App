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

  String musclepartlist = 'Back';
  String setnumber = '1';
  String repsnumber = '1';
  String weight = '1';

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
                // icon: const Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
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
                // icon: const Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
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
                // icon: const Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
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
              DropdownButton<String>(
                value: weight,
                // icon: const Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
                onChanged: (String? weightnumber) {
                  setState(() {
                    weight = weightnumber!;
                  });
                },
                items:
                    List.generate(200, (int index) => ((index + 1)).toString())
                        .map<DropdownMenuItem<String>>((String weights) {
                  return DropdownMenuItem<String>(
                    value: weights,
                    child: Text(weights.toString()),
                  );
                }).toList(),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const NewExercise(),
                    ),
                  );
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
