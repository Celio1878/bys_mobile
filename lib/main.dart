import 'package:app/components/animated_section.dart';
import 'package:app/components/bottom_navigation_bar.dart';
import 'package:app/components/buttons/sign_in_button.dart';
import 'package:app/components/feature_section.dart';
import 'package:app/components/hero_section.dart';
import 'package:app/components/join_us_section.dart';
import 'package:app/components/logo.dart';
import 'package:app/components/security_section.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          title: Logo(),
          actions: [SignInButton()],
          toolbarHeight: 75,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeroSection(),
              SizedBox(height: 16),
              AnimatedSection(child: FeaturesSection()),
              SizedBox(height: 16),
              AnimatedSection(child: SecuritySection()),
              SizedBox(height: 16),
              AnimatedSection(child: JoinUsSection()),
            ],
          ),
        )),
        bottomNavigationBar: const NavBar());
  }
}
