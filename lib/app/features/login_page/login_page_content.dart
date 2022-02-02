import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/app/features/login_page/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
    // required this.onCreate,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final Function onCreate;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var creatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: null,
        builder: (context, snapshot) {
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
                      Text(
                        creatingAccount == false
                            ? 'Zaloguj Się'
                            : 'Zarejestruj sie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                          // onChanged: (emailValue) {
                          //   context.read<LoginCubit>().emailEnter(emailValue);
                          // },
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
                                  borderSide:
                                      BorderSide(color: Color(0xff616161))))),
                      SizedBox(
                        // child: Text(print(emailValue)),
                        height: 15,
                      ),
                      TextField(
                        // onChanged: (passwordValue) {
                        //   context
                        //       .read<LoginCubit>()
                        //       .passwordEnter(passwordValue);
                        // },
                        obscureText: true,
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
                      Text(
                        errorMessage,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
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
                                        password:
                                            widget.passwordController.text);
                              } catch (error) {
                                setState(() {
                                  errorMessage = 'Something went wrong!';
                                });
                                widget.emailController.clear();
                                widget.passwordController.clear();
                              }
                            } else {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: widget.emailController.text,
                                  password: widget.passwordController.text,
                                );
                                widget.emailController.clear();
                                widget.passwordController.clear();
                                // widget.onCreate();
                              } catch (error) {
                                setState(() {
                                  errorMessage = 'Wrong email or password!';
                                });
                                widget.emailController.clear();
                                widget.passwordController.clear();
                              }
                            }
                          },
                          child: Text(
                            creatingAccount == false ? 'Login' : 'Register',
                            style: TextStyle(color: Color(0xff616161)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber)),
                      SizedBox(
                        height: 20,
                      ),
                      if (creatingAccount == false) ...[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              creatingAccount = true;
                              errorMessage = '';
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
                          child: const Text('Already have account?',
                              style: TextStyle(color: Colors.amber)),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
