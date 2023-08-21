import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'Homepage.dart';
import 'Services/NotificationServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDetection();
  runApp(const MyApp());
}

Future<void> initializeDetection() async {
  final service = FlutterBackgroundService();

  service.configure(
    androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
        notificationChannelId: "bcConst",
        foregroundServiceNotificationId: 888,
        initialNotificationTitle: "Twister",
        initialNotificationContent: "Shaky shaky detected!"),
    iosConfiguration:
        IosConfiguration(onForeground: onStart, onBackground: onIosBackground),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  DateTime lastTrigger = DateTime.now();

  List<double> _gyroscopeValues = <double>[0, 0, 0];
  late StreamSubscription<dynamic> _gyroscopeSubscription;

  NotificationServices notificationServices = NotificationServices();
  notificationServices.initializeNotifications();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  _gyroscopeSubscription = gyroscopeEvents.listen(
    (GyroscopeEvent event) {
      _gyroscopeValues = <double>[event.x, event.y, event.z];

      DateTime curr = DateTime.now();

      print((curr.difference(lastTrigger).inSeconds).abs());

      if ((curr.difference(lastTrigger).inSeconds).abs() > 20) {
        notificationServices.sendNotification(
            "Detection over", "Waited for more than 5 minutes");
        service.stopSelf();
      }

      const double threshold = 2;
      if (_gyroscopeValues[0].abs() > threshold ||
          _gyroscopeValues[1].abs() > threshold ||
          _gyroscopeValues[2].abs() > threshold) {
        lastTrigger = DateTime.now();
        // notificationServices.sendNotification("Twister", "Shaky shaky detected!");
        flutterLocalNotificationsPlugin
            .show(
              888,
              "Motion Detector",
              // "x: ${_gyroscopeValues[0]}y: ${_gyroscopeValues[1]}z: ${_gyroscopeValues[2]}",
              "In Motion",
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  'bcConst',
                  'MY FOREGROUND SERVICE',
                  icon: 'logo',
                  ongoing: true,
                ),
              ),
            )
            .then(
              (value) => {
                Timer(
                  const Duration(seconds: 2),
                  () {
                    flutterLocalNotificationsPlugin.show(
                      888,
                      "Motion Detector",
                      // "x: ${_gyroscopeValues[0]}y: ${_gyroscopeValues[1]}z: ${_gyroscopeValues[2]}",
                      "Stationary",
                      const NotificationDetails(
                        android: AndroidNotificationDetails(
                          enableVibration: false,
                          'bcConst',
                          'MY FOREGROUND SERVICE',
                          icon: 'logo',
                          ongoing: true,
                        ),
                      ),
                    );
                  },
                )
              },
            );
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twist Detector by Revant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
