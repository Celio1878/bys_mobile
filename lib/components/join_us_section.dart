import 'package:app/components/buttons/sign_in_button.dart';
import 'package:app/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinUsSection extends StatelessWidget {
  const JoinUsSection({super.key});
  static const _padding = EdgeInsets.symmetric(vertical: 40, horizontal: 16);
  static const _borderRadius = BorderRadius.all(Radius.circular(20));
  static const _titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const _descriptionStyle = TextStyle(fontSize: 16, color: Colors.white);
  static const _verticalSpacing = SizedBox(height: 10);
  static const _buttonSpacing = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final hasUser =
        Provider.of<UserState>(context, listen: false).user?.email != null;

    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple.shade600, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: _borderRadius,
        ),
        child: Padding(
          padding: _padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Junte-se à Nossa Comunidade',
                textAlign: TextAlign.center,
                style: _titleStyle,
              ),
              _verticalSpacing,
              Text(
                'Torne-se parte de uma comunidade em constante crescimento de leitores e escritores.',
                textAlign: TextAlign.center,
                style: _descriptionStyle,
              ),
              _buttonSpacing,
              if (!hasUser) const SignInButton()
            ],
          ),
        ));
  }
}
