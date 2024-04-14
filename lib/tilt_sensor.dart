import 'package:flutter/material.dart';

class SensorApp extends StatelessWidget {
  const SensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 -50;
    final centerY = MediaQuery.of(context).size.height / 2 -50;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.blue,

              ),
            width: 100,
            height: 100,
              color: Colors.orangeAccent,

          ),),

        ],
      ),

    );
  }
}
