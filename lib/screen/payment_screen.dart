import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String parkingLot;

  PaymentScreen({required this.parkingLot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parking Lot: $parkingLot'),
            // Add payment integration here
            ElevatedButton(
              onPressed: () {
                // Handle payment processing
                // Show notification on success
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
