import 'package:flutter/material.dart';
import 'package:gymapp/app/features/bottomnavigationbar/account_page/cubit/account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'You are login as: $email ',
                  style: TextStyle(color: Colors.amber),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AccountCubit>().logOut();
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.amber),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}

// ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => const NewTrainingDay(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.add, size: 18),
//                 label: const Text("Add Training Day"),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey[700], // background color
//                 ),
//               ),
