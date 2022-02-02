import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/app/features/bottomnavigationbar/account_page/account_page_content.dart';
import 'package:gymapp/app/features/bottomnavigationbar/newtrainingday/newtrainingday_page.dart';
import 'package:gymapp/app/features/bottomnavigationbar/statspage/statspage_content.dart';
import 'package:gymapp/app/features/bottomnavigationbar/training_days/training_days_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return TrainingDays(
              email: widget.user.email,
              user: widget.user,
            );
          }
          if (currentIndex == 1) {
            return NewTrainingDay();
          }

          return StatsPage();

          // return AccountPage(
          //   email: widget.user.email,
          // );
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Trainig Days'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Create New Day'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'Statistics'),
        ],
      ),
    );
  }
}
