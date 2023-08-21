import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';
import 'Services/NotificationServices.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  List<double> _gyroscopeValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _gyroscopeSubscription;

  Color flashColor = Colors.white;

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    notificationServices.initializeNotifications();
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
        const double threshold = 2;

        if (_gyroscopeValues[0].abs() > threshold ||
            _gyroscopeValues[1].abs() > threshold ||
            _gyroscopeValues[2].abs() > threshold) {
          Vibration.vibrate(duration: 500);
          flashColor = Colors.red;
          Timer(const Duration(milliseconds: 500), () {
            flashColor = Colors.white;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: flashColor,
        child: Center(
          child: Text(
            'Gyroscope: \n${_gyroscopeValues[0]}\n${_gyroscopeValues[1]}\n${_gyroscopeValues[2]}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
