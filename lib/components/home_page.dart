import 'package:app/components/animated_section.dart';
import 'package:app/components/bottom_navigation_bar.dart';
import 'package:app/components/buttons/sign_in_button.dart';
import 'package:app/components/feature_section.dart';
import 'package:app/components/hero_section.dart';
import 'package:app/components/join_us_section.dart';
import 'package:app/components/logo.dart';
import 'package:app/components/security_section.dart';
import 'package:app/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final user = userState.user;

    return Scaffold(
        appBar: AppBar(
          title: Logo(),
          actions: user != null ? [] : [SignInButton()],
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
        bottomNavigationBar: BottomNavBar());
  }
}
