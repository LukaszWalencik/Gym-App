import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExercise extends StatefulWidget {
  NewExercise({
    Key? key,
  }) : super(key: key);

  @override
  State<NewExercise> createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {
  final exercisecontroller = TextEditingController();
  final commentcontroller = TextEditingController();

  String dropdownValue = 'Plecy';

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
            padding: EdgeInsets.all(10),
            children: [
              const Text('Partia mięśni:', style: TextStyle(fontSize: 20)),
              DropdownButton<String>(
                value: dropdownValue,
                // icon: const Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Plecy', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Ćwiczenie:', style: TextStyle(fontSize: 20)),
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
              const Text('Ilość serii:', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              const Text('Powtórzenia:', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              const Text('Obciążenie:', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              const Text('Comment:', style: TextStyle(fontSize: 20)),
              TextField(
                style: TextStyle(
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
            ],
          ),

          // ElevatedButton(
          //   style: ButtonStyle(),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('Cofnij do ekranu głównego'),
          // )
        ),
      ),
    );
  }
}

class NewExerciseTextField extends StatelessWidget {
  const NewExerciseTextField({
    Key? key,
    required this.textcontroller,
  }) : super(key: key);

  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textcontroller,
      decoration: InputDecoration(
        hintText: 'To jest podpowiedź',
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 15,
        ),
      ),
    );
  }
}
