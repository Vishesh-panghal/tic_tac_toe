// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedCode = '';

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Connect with Friends',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(-1, 1),
                        ),
                      ]),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 350,
              width: 350,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _QRViewCreated,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              scannedCode,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(-1, 1),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void _QRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code!;
      });
    });
  }
}
