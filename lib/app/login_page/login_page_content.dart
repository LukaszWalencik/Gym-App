import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var creatingAccount = false;

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
                Text(creatingAccount == false
                    ? 'Zaloguj Się'
                    : 'Zarejestruj sie'),
                SizedBox(
                  height: 50,
                ),
                TextField(
                    controller: widget.emailController,
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
                  controller: widget.passwordController,
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
                    onPressed: () async {
                      if (creatingAccount == true) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: widget.emailController.text,
                            password: widget.passwordController.text,
                          );
                        } catch (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                        }
                      } else {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: widget.emailController.text,
                            password: widget.passwordController.text,
                          );
                        } catch (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                        }
                      }
                    },
                    child: Text(
                      creatingAccount == false ? 'Login' : 'Register',
                      style: TextStyle(color: Color(0xff616161)),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber)),
                SizedBox(
                  height: 20,
                ),
                if (creatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        creatingAccount == true;
                      });
                    },
                    child: Text(
                      'Create account',
                      style: TextStyle(color: Colors.amber),
                    ),
                  )
                ],
                if (creatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        creatingAccount = false;
                      });
                    },
                    child: const Text('Already have account?'),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
