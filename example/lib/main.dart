import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device/device.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _batteryLevel = 'Unknown';
  final _devicePlugin = Device();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    late String platformVersion;
    late String batteryLevel;

    try {
      platformVersion = await _devicePlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    try {
      batteryLevel = (await _devicePlugin.getBatteryLevel()).toString();
    } catch (e) {
      batteryLevel = 'Failed to get battery level.';
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            children: [
              Text('Running on the version: $_platformVersion\n'),
              const SizedBox(height: 16),
              Text('Battery level: $_batteryLevel\n'),
            ],
          ),
        ),
      ),
    );
  }
}
