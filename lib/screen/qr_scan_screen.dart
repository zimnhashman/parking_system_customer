import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code')),
      body: QRView(
        key: GlobalKey(),
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((scanData) {
            // Handle QR code data
            Navigator.pop(context, scanData.code);
          });
        },
      ),
    );
  }
}
