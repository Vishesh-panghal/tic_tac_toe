import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tic_tac_toe/mainScreen.dart';
import 'package:tic_tac_toe/scanScreen.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  String gameId = 'game';

  @override
  void initState() {
    Random random = Random();
    gameId = random.nextInt(10000000).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreenPage(),
                  ));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 32,
            ),
          ),
          const Spacer(),
        ],
        backgroundColor: Colors.purple.shade100,
      ),
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(6),
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.2,
                  )),
              child: QrImageView(
                data: gameId,
                version: QrVersions.auto,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScanScreen(),
                        ));
                  },
                  child: const Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Random random = Random();
                      gameId = random.nextInt(10000000).toString();
                    });
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
