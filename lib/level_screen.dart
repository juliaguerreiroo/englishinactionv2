import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Importando o pacote
import 'quiz_screen.dart';

class LevelScreen extends StatelessWidget {
  final String level;

  // Map de vídeos para os níveis
  final Map<String, String> videoMap = {
    "Level 1": "jvuy4fvlsa8&t",
    "Level 2": "DcCj6oIeRs0&t",
    "Level 3": "8-sAATeyo_A",
    "Level 4": "mFLvCdQVCpU",
    "Level 5": "LuZa_bQAAao", // Substitua pelos IDs corretos
  };

  LevelScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    // Obter o ID do vídeo correspondente ao nível
    String videoId = videoMap[level] ?? "default_video_id";
    String videoUrl = "https://www.youtube.com/watch?v=$videoId";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 185),
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[900]!, Colors.red[900]!],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                level,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildCard(
              title: "Slides",
              description: "Veja os slides do conteúdo",
              buttonText: "Ver slides",
              context: context,
            ),
            _buildCard(
              title: "Atividades",
              description: "Realize nossas atividades agora mesmo",
              buttonText: "Iniciar atividades",
              context: context,
              onPressed: () {
                // Navegar para a tela de atividades
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
            _buildCard(
              title: "Vídeo",
              description: "Assista ao vídeo para complementar seu aprendizado",
              buttonText: "Assistir no YouTube",
              context: context,
              videoId: videoId,
              videoUrl: videoUrl,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String buttonText,
    required BuildContext context,
    String? videoId,
    String? videoUrl,
    VoidCallback? onPressed,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900]),
            ),
            Divider(color: Colors.red[700], thickness: 1),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            if (videoId != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 200,
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: onPressed ?? () => _launchURL(videoUrl!),
              child: Text(buttonText, style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}
