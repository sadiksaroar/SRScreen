import 'package:flutter/material.dart';

void main() => runApp(const SRApp());

class SRApp extends StatelessWidget {
  const SRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SRScreen(),
    );
  }
}

class SRScreen extends StatelessWidget {
  const SRScreen({super.key});

  final List<Map<String, dynamic>> players = const [
    {
      "name": "Ioannidis",
      "sr": "8,33",
      "srColor": Colors.blue,
      "last5": [9, 9, 0, 10, 8]
    },
    {
      "name": "Bernard",
      "sr": "8,14",
      "srColor": Colors.blue,
      "last5": [8, 9, 9, 8, 7]
    },
    {
      "name": "Vlachodimos",
      "sr": "7,91",
      "srColor": Colors.blue,
      "last5": [8, 3, 7, 9, 9]
    },
    {
      "name": "Mladenovic",
      "sr": "7,22",
      "srColor": Colors.blue,
      "last5": [6, 6, 6, 7, 6]
    },
    {
      "name": "Schenkeveld",
      "sr": "6,95",
      "srColor": Colors.blue,
      "last5": [6, 8, 7, 8, 7]
    },
    {
      "name": "Vilhena",
      "sr": "6,76",
      "srColor": Colors.blue,
      "last5": [7, 5, 7, 8, 7]
    },
    {
      "name": "SG12",
      "sr": "6,45",
      "srColor": Colors.blue,
      "last5": [6, 4, 7, 8, 7]
    },
    {
      "name": "Ioannidis",
      "sr": "5,99",
      "srColor": Colors.blue,
      "last5": [6, 5, 7, 4, 7]
    },
    {
      "name": "Palacios",
      "sr": "5,94",
      "srColor": Colors.blue,
      "last5": [7, 6, 5, 5, 6]
    },
    {
      "name": "Bernard",
      "sr": "5,79",
      "srColor": Colors.blue,
      "last5": [5, 6, 6, 4, 9]
    },
  ];

  Color getColor(int value) {
    if (value >= 9) return Colors.green.shade700;
    if (value >= 7) return Colors.orange.shade600;
    if (value >= 5) return Colors.green;
    return Colors.grey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This pops the current screen and goes back
          },
        ),
        title: const Text("SR TOP 10"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                "Panathinaikos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          // Header Row
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Center(child: Text('#'))),
                Expanded(flex: 3, child: Text('Player')),
                Expanded(flex: 2, child: Center(child: Text('SR'))),
                Expanded(flex: 5, child: Center(child: Text('LAST 5'))),
              ],
            ),
          ),
          // List Rows
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final p = players[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                    color: index == 0 ? Colors.yellow.shade100 : null,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                        flex: 3,
                        child: Text(
                          p['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: index == 0 ? Colors.black : Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            p['sr'],
                            style: TextStyle(
                              color: p['srColor'],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: (p['last5'] as List<int>).map((val) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: getColor(val),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                val.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
