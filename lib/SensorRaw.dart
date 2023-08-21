import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Alldec extends StatefulWidget {
  const Alldec({super.key});

  @override
  State<Alldec> createState() => _AlldecState();
}

class _AlldecState extends State<Alldec> {
  List<double> _accelerometerValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _accelerometerSubscription;

  List<double> _userAccelerometerValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _userAccelerometerSubscription;

  List<double> _gyroscopeValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });

    _userAccelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    });

    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _accelerometerSubscription.cancel();
    _userAccelerometerSubscription.cancel();
    _gyroscopeSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Sensor Raw Data'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Accelerometer: \n${_accelerometerValues[0]}\n${_accelerometerValues[1]}\n${_accelerometerValues[2]}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'User Accelerometer: \n${_userAccelerometerValues[0]}\n${_userAccelerometerValues[1]}\n${_userAccelerometerValues[2]}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Gyroscope: \n${_gyroscopeValues[0]}\n${_gyroscopeValues[1]}\n${_gyroscopeValues[2]}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}

class Accdec extends StatefulWidget {
  const Accdec({super.key});

  @override
  State<Accdec> createState() => _AccdecState();
}

class _AccdecState extends State<Accdec> {
  List<double> _accelerometerValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _accelerometerSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Accelerometer: \n${_accelerometerValues[0]}\n${_accelerometerValues[1]}\n${_accelerometerValues[2]}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class UsereAccdec extends StatefulWidget {
  const UsereAccdec({super.key});

  @override
  State<UsereAccdec> createState() => _UsereAccdecState();
}

class _UsereAccdecState extends State<UsereAccdec> {
  List<double> _userAccelerometerValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _userAccelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _userAccelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _userAccelerometerSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'User Accelerometer: \n${_userAccelerometerValues[0]}\n${_userAccelerometerValues[1]}\n${_userAccelerometerValues[2]}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}

class Gyrodec extends StatefulWidget {
  const Gyrodec({super.key});

  @override
  State<Gyrodec> createState() => _GyrodecState();
}

class _GyrodecState extends State<Gyrodec> {
  List<double> _gyroscopeValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _gyroscopeSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Gyroscope: \n${_gyroscopeValues[0]}\n${_gyroscopeValues[1]}\n${_gyroscopeValues[2]}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
