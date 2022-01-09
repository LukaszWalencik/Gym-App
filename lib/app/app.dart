import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/app/cubit/home_cubit.dart';
import 'package:gymapp/app/home_page_content.dart';
import 'package:gymapp/app/login_page/login_page_content.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  const Root({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..iniciation(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage();
        },
      ),
    );
  }
}
