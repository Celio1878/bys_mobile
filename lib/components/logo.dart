// create a logo widget
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final bucketUrl = dotenv.env['BUCKET_URL'];

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$bucketUrl/other_images/logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
