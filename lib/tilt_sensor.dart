import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorApp extends StatelessWidget {
  const SensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    //가로 모드
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEventStream(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final event = snapshot.data!;
              List<double> accelerometerValues =[event.x, event.y, event.z];
              print(accelerometerValues);

              return Positioned(
                left: centerX+ event.y*15,
                top: centerY + event.x*15,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  width: 100,
                  height: 100,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
