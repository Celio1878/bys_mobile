import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  final List<Map<String, String>> features = [
    {"icon": "📚", "title": "Descubra Grandes Leituras"},
    {"icon": "✍️", "title": "Escreva Suas Histórias"},
    {"icon": "🤝", "title": "Faça Parte da Comunidade"},
  ];

  FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: features.map((feature) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Text(
                  feature['icon']!,
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  feature['title']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Conecte-se com pessoas de ideias semelhantes e explore novos horizontes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
