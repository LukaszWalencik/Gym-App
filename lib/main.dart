// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Gym App - Be Strong!',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.amber,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gym.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 5.0, color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DayOne()));
              },
              child: Text(
                "FIRST DAY TRAINING",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("First Day Training"),
            ),

            // IconButton(
            //   icon: Image.asset('images/hantelicon.jpg'),
            //   iconSize: 80,
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (_) => DayOne()));
            //   },
            // ),
            // IconButton(
            //   icon: Image.asset('images/hantelicon.jpg'),
            //   iconSize: 80,
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (_) => DayTwo()));
            //   },
            // ),
            Center(),
          ],
        ),
      ),
    );
  }
}

class DayOne extends StatelessWidget {
  const DayOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Day One',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.amber,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cofnij do ekranu głównego'),
            )
          ],
        ),
      ),
    );
  }
}

class DayTwo extends StatelessWidget {
  const DayTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Day Two',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.amber,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cofnij do ekranu głównego'),
            )
          ],
        ),
      ),
    );
  }
}
