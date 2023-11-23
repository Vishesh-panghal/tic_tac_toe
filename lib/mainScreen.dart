// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:motion/motion.dart';
import 'package:tic_tac_toe/connectionScreen.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  int oScore = 0;
  int xScore = 0;

  bool oTurn = true;
  int filledBox = 0;

  bool gameWon = false;

  List<String> displayO = List.filled(9, '');
  String resultDeclares = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Player O',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const Text(
                        'Score ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        oScore.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        resetScore();
                      },
                      child: const Icon(Icons.refresh)),
                  Column(
                    children: [
                      const Text(
                        'Player X',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const Text(
                        'Score ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        xScore.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Motion.elevated(
                elevation: 70,
                glare: false,
                shadow: true,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (!gameWon) {
                          _tapped(index);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade200,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            displayO[index],
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 52,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              resultDeclares,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 85,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor: Colors.purple.shade400),
                  onPressed: () {
                    resetGame();
                  },
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectionScreen(),
                    ));
              },
              child: const Text(
                'Connect',
                style: TextStyle(color: Colors.white, fontSize: 22, shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 12,
                    blurStyle: BlurStyle.inner,
                    offset: Offset(1, 1),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayO[index] == '') {
        displayO[index] = 'O';
        filledBox++;
      } else if (!oTurn && displayO[index] == '') {
        displayO[index] = 'X';
        filledBox++;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayO[0] == displayO[1] &&
        displayO[0] == displayO[2] &&
        displayO[0] != '') {
      resultDeclares = 'Player ${displayO[0]} is winner';
      updateScore(displayO[0]);
    }
    if (displayO[3] == displayO[4] &&
        displayO[3] == displayO[5] &&
        displayO[3] != '') {
      resultDeclares = 'Player ${displayO[3]} is winner';
      updateScore(displayO[3]);
    }
    if (displayO[6] == displayO[7] &&
        displayO[6] == displayO[8] &&
        displayO[6] != '') {
      resultDeclares = 'Player ${displayO[6]} is winner';
      updateScore(displayO[6]);
    }
    if (displayO[0] == displayO[3] &&
        displayO[0] == displayO[6] &&
        displayO[0] != '') {
      resultDeclares = 'Player ${displayO[0]} is winner';
      updateScore(displayO[0]);
    }
    if (displayO[1] == displayO[4] &&
        displayO[1] == displayO[7] &&
        displayO[1] != '') {
      resultDeclares = 'Player ${displayO[1]} is winner';
      updateScore(displayO[1]);
    }
    if (displayO[2] == displayO[5] &&
        displayO[2] == displayO[8] &&
        displayO[2] != '') {
      resultDeclares = 'Player ${displayO[2]} is winner';
      updateScore(displayO[2]);
    }
    if (displayO[0] == displayO[4] &&
        displayO[0] == displayO[8] &&
        displayO[0] != '') {
      resultDeclares = 'Player ${displayO[0]} is winner';
      updateScore(displayO[0]);
    }
    if (displayO[2] == displayO[4] &&
        displayO[2] == displayO[6] &&
        displayO[2] != '') {
      resultDeclares = 'Player ${displayO[2]} is winner';
      updateScore(displayO[2]);
    } else if (filledBox == 9) {
      resultDeclares = 'Tie';
    }
  }

  void updateScore(String winner) {
    setState(() {
      if (winner == 'O') {
        oScore++;
        gameWon = true;
      } else if (winner == 'X') {
        xScore++;
        gameWon = true;
      }
    });
  }

  void resetGame() {
    setState(() {
      displayO = List.filled(9, '');
      resultDeclares = '';
      filledBox = 0;
      gameWon = false;
    });
  }

  void resetScore() {
    setState(() {
      oScore = 0;
      xScore = 0;
    });
  }
}
