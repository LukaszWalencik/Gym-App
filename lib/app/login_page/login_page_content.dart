import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: const Text(
          'Gym App - Be Strong!',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gym.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                  style: TextStyle(color: Colors.amber),
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber)))),
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(color: Colors.amber),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.amber,
                  ),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[700],
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
