import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartData {
  ChartData(this.xdata, this.ydata, this.zdata, this.timestamp);
  final double xdata;
  final double ydata;
  final double zdata;
  final int timestamp;
}

class AccelerometerGraph extends StatefulWidget {
  const AccelerometerGraph({super.key});

  @override
  State<AccelerometerGraph> createState() => _AccelerometerGraphState();
}

class _AccelerometerGraphState extends State<AccelerometerGraph> {
  late StreamSubscription<dynamic> _accelerometerSubscription;
  int datasize = 200;

  List<ChartData> graphData = [];

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      int time = DateTime.now().microsecondsSinceEpoch;
      graphData.add(ChartData(event.x, event.y, event.z, time));
      setState(() {
        if (graphData.length > datasize) {
          graphData = graphData.sublist(1, datasize + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _accelerometerSubscription.cancel();
  }

  /// The method returns line series to chart.
  List<LineSeries<ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "X-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.xdata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Y-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.ydata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Z-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.zdata,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer Graph'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SfCartesianChart(
          legend: const Legend(isVisible: true),
          plotAreaBorderWidth: 0,
          series: _getDefaultLineSeries()),
    );
  }
}

class UserAccelerometerGraph extends StatefulWidget {
  const UserAccelerometerGraph({super.key});

  @override
  State<UserAccelerometerGraph> createState() => _UserAccelerometerGraphState();
}

class _UserAccelerometerGraphState extends State<UserAccelerometerGraph> {
  late StreamSubscription<dynamic> _userAccelerometerSubscription;

  int datasize = 200;

  List<ChartData> graphData = [];

  @override
  void initState() {
    super.initState();
    _userAccelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      int time = DateTime.now().microsecondsSinceEpoch;
      graphData.add(ChartData(event.x, event.y, event.z, time));
      setState(() {
        if (graphData.length > datasize) {
          graphData = graphData.sublist(1, datasize + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _userAccelerometerSubscription.cancel();
  }

  /// The method returns line series to chart.
  List<LineSeries<ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "X-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.xdata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Y-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.ydata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Z-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.zdata,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Accelerometer Graph'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SfCartesianChart(
          plotAreaBorderWidth: 0, series: _getDefaultLineSeries()),
    );
  }
}

class GyroscopeGraph extends StatefulWidget {
  const GyroscopeGraph({super.key});

  @override
  State<GyroscopeGraph> createState() => _GyroscopeGraphState();
}

class _GyroscopeGraphState extends State<GyroscopeGraph> {
  late StreamSubscription<dynamic> _gyroscopeSubscription;

  int datasize = 200;

  List<ChartData> graphData = [];

  @override
  void initState() {
    super.initState();
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      int time = DateTime.now().microsecondsSinceEpoch;
      graphData.add(ChartData(event.x, event.y, event.z, time));
      setState(() {
        if (graphData.length > datasize) {
          graphData = graphData.sublist(1, datasize + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    //...
    super.dispose();
    _gyroscopeSubscription.cancel();
  }

  /// The method returns line series to chart.
  List<LineSeries<ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "X-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.xdata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Y-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.ydata,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<ChartData, num>(
          dataSource: graphData,
          name: "Z-Axis",
          xValueMapper: (ChartData point, _) => point.timestamp,
          yValueMapper: (ChartData point, _) => point.zdata,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscope Graph'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SfCartesianChart(
          plotAreaBorderWidth: 0, series: _getDefaultLineSeries()),
    );
  }
}
