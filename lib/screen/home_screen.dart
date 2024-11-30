import 'package:flutter/material.dart';
import 'package:parking_system_customer/screen/payment_screen.dart';
import 'package:parking_system_customer/services/api_service.dart';
import 'qr_scan_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parking App')),
      body: FutureBuilder(
        future: apiService.fetchParkingLots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final parkingLots = snapshot.data;

          return ListView.builder(
            itemCount: parkingLots!.length,
            itemBuilder: (context, index) {
              final lot = parkingLots[index];
              return ListTile(
                title: Text(lot.location),
                subtitle: Text(lot.status),
                onTap: () async {
                  // Navigate to QR scanner
                  final qrCode = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScanScreen()),
                  );

                  if (qrCode != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(parkingLot: qrCode),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
