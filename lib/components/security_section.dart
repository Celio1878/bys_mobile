import 'package:flutter/material.dart';

class SecuritySection extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "icon": "🔒",
      "title": "Segurança Avançada",
      "description":
          "Seus dados são protegidos com criptografia de ponta a ponta e armazenados em servidores seguros."
    },
    {
      "icon": "🔑",
      "title": "Controle Total",
      "description":
          "Você tem controle total sobre seus dados e pode gerenciar suas informações como preferir."
    },
    {
      "icon": "🌐",
      "title": "Conformidade Global",
      "description":
          "Estamos em conformidade com as principais regulamentações, incluindo LGPD e GDPR."
    },
  ];

  SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: items.map((item) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    item['icon']!,
                    style: TextStyle(fontSize: 48),
                  ),
                  Text(
                    item['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item['description']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
