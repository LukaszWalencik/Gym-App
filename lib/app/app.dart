import 'package:flutter/material.dart';
import 'package:gymapp/app/bottomnavigationbar/account_page/account_page_content.dart';
import 'package:gymapp/app/bottomnavigationbar/newtrainingday/newtrainingday_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return Scaffold(
              body: Center(
                child: Text('index 0'),
              ),
            );
          }
          if (currentIndex == 1) {
            return NewTrainingDay();
          }

          return AccountPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        backgroundColor: Colors.grey[700],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Exercise days'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Add trening day'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
