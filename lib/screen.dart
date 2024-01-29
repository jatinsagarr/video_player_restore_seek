import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String salonName;
  final String artistName;
  final String rating;
  final int booking;
  const Screen2({super.key, required this.booking, required this.salonName, required this.artistName, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              artistName,
              style: const TextStyle(fontSize: 30.0),
            ),
           const  SizedBox(height: 10),
            Text(
              salonName,
              style: const TextStyle(fontSize: 30.0),
            ),
           const  SizedBox(height: 10),
            Text(
              rating,
              style: const TextStyle(fontSize: 30.0),
            ),
           const  SizedBox(height: 10),
            Text(
              "$booking",
              style: const TextStyle(fontSize: 30.0),
            ),
           const  SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
