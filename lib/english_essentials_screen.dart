import 'package:flutter/material.dart';
import 'level_screen.dart';

class EnglishEssentialsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cards = [
    {'color': Colors.blue[900], 'icon': Icons.book, 'level': 'Nível 1', 'buttonColor': Colors.blue[700]},
    {'color': Colors.red[900], 'icon': Icons.language, 'level': 'Nível 2', 'buttonColor': Colors.red[700]},
    {'color': Colors.blue[900], 'icon': Icons.school, 'level': 'Nível 3', 'buttonColor': Colors.blue[700]},
    {'color': Colors.red[900], 'icon': Icons.star, 'level': 'Nível 4', 'buttonColor': Colors.red[700]},
    {'color': Colors.blue[900], 'icon': Icons.check_circle, 'level': 'Nível 5', 'buttonColor': Colors.blue[700]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Text(
              'English Essentials',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Card(
                  color: cards[index]['color'],
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: 80,
                        child: Center(
                          child: Icon(
                            cards[index]['icon'],
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        cards[index]['level'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(level: cards[index]['level']),
                              ),
                            );
                          },
                          child: Text("Iniciar"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: cards[index]['buttonColor'], // Cor de fundo do botão
                            foregroundColor: Colors.white, // Cor do texto para branco
                          ),
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
