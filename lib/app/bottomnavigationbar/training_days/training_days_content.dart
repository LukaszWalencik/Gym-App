import 'package:flutter/material.dart';

class TrainingDays extends StatelessWidget {
  const TrainingDays({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Training Days',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.grey[700],
                          child: Center(
                            child: Text(
                              '1dzien',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey[700],
                          child: SizedBox(
                            child: Center(
                                child: Text('1dzien',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600))),
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
