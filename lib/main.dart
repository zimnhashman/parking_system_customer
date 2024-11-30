import 'package:flutter/material.dart';
import 'package:parking_system_customer/screen/home_screen.dart';

void main() {
  runApp(ParkingApp());
}

class ParkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
