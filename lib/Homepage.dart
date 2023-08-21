import 'package:flutter/material.dart';
import 'FlashScreen.dart';
import 'FootballCalibration.dart';
import 'SensorGraph.dart';
import 'SensorRaw.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // make route to all the pages
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twist Detector'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Alldec()),
                  );
                },
                child: const Text('All Sensors Raw')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Accdec()),
                      );
                    },
                    child: const Text('Accelerometer\n Raw',
                        textAlign: TextAlign.center)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccelerometerGraph()),
                      );
                    },
                    child: const Text('Accelerometer\n Graph',
                        textAlign: TextAlign.center)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UsereAccdec()),
                      );
                    },
                    child: const Text('User Accelerometer\n Raw',
                        textAlign: TextAlign.center)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserAccelerometerGraph()),
                      );
                    },
                    child: const Text('User Accelerometer\n Graph',
                        textAlign: TextAlign.center)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Gyrodec()),
                      );
                    },
                    child: const Text('Gyroscope\n Raw',
                        textAlign: TextAlign.center)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserAccelerometerGraph()),
                      );
                    },
                    child: const Text('Gyroscope\n Graph',
                        textAlign: TextAlign.center)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FlashScreen()),
                  );
                },
                child: const Text("Flashscreen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FootballCalibration()),
                  );
                },
                child: const Text("Football Calibration")),
          ],
        ),
      ),
    );
  }
}
