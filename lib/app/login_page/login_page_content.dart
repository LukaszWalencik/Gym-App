import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          'Gym App - Be Strong!',
          style: TextStyle(
            color: Color(0xff616161),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[700],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                    controller: emailController,
                    style: TextStyle(color: Color(0xff616161)),
                    cursorColor: Color(0xff616161),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff616161),
                        ),
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.amber,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff616161))))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordController,
                  cursorColor: Color(0xff616161),
                  style: TextStyle(color: Color(0xff616161)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Color(0xff616161),
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.amber,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff616161))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color(0xff616161)),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber)),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Registered',
                      style: TextStyle(color: Colors.amber),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
