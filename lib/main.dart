import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const BysApp());
}

class BysApp extends StatelessWidget {
  const BysApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bucketUrl = dotenv.env['BUCKET_URL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              '$bucketUrl/other_images/logo.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ))
          ],
        ),
        toolbarHeight: 100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
