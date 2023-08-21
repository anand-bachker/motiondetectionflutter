import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FootballCalibration extends StatefulWidget {
  const FootballCalibration({super.key});

  @override
  State<FootballCalibration> createState() => _FootballCalibrationState();
}

class _FootballCalibrationState extends State<FootballCalibration> {
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

  void dispose(){
    //...
    super.dispose();
    _accelerometerSubscription.cancel();
}

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Allign your ball'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/football_pitch.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(-_accelerometerValues[0] * wid * 0.05,
                    _accelerometerValues[1] * hei * 0.05),
                child: Image.asset(
                  'assets/images/football.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
