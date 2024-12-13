import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Definindo as respostas corretas
  final Map<int, String> _correctAnswers = {
    1: 'A',
    2: 'B',
    3: 'C',
  };

  // Controlando as respostas selecionadas
  Map<int, String> _userAnswers = {
    1: '',
    2: '',
    3: '',
  };

  // Função para verificar respostas
  int _getScore() {
    int score = 0;
    _userAnswers.forEach((question, answer) {
      if (_correctAnswers[question] == answer) {
        score++;
      }
    });
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Permite rolar a tela quando necessário
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título da página
              Text(
                'Responda às perguntas abaixo:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Pergunta 1
              _buildQuestion(
                1,
                'Qual é o plural de "child"?',
                ['A) Children', 'B) Childs', 'C) Childer', 'D) Childes'],
              ),

              // Pergunta 2
              _buildQuestion(
                2,
                'Qual é o verbo correto para a frase: "She ____ to the store."',
                ['A) Go', 'B) Goes', 'C) Gone', 'D) Going'],
              ),

              // Pergunta 3
              _buildQuestion(
                3,
                'Qual dessas frases está correta?',
                ['A) He can sings well.', 'B) He can sing well.', 'C) He can sung well.', 'D) He can singing well.'],
              ),

              SizedBox(height: 20),

              // Botão para submeter as respostas
              ElevatedButton(
                onPressed: () {
                  int score = _getScore();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Resultado"),
                        content: Text("Você acertou $score de 3 perguntas."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Fechar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Submeter", style: TextStyle(color: Colors.white)), // Cor do texto do botão
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Usando backgroundColor
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para gerar as questões e suas opções
  Widget _buildQuestion(int questionNumber, String questionText, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exibindo a pergunta
        Text(
          'Pergunta $questionNumber: $questionText',
          style: TextStyle(fontSize: 16),
        ),
        // Gerando as opções de resposta (Radio buttons)
        ...List.generate(
          options.length,
              (index) => RadioListTile<String>(
            title: Text(options[index]),
            value: String.fromCharCode(65 + index), // 'A', 'B', 'C', 'D'
            groupValue: _userAnswers[questionNumber],
            onChanged: (value) {
              setState(() {
                _userAnswers[questionNumber] = value!;
              });
            },
          ),
        ),
        SizedBox(height: 10), // Espaço entre as perguntas
      ],
    );
  }
}
