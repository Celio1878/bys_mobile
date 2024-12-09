import 'package:app/service/auth.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () async {
        try {
          final user = AuthService().login();

          print("User Mounted: $user");
        } catch (e) {
          print(
            "Error: $e",
          );
        }
      },
      label: const Text("Login"),
      // Google icon
      icon: Image.asset(
        "assets/icons/google_icon.png",
        width: 20,
        height: 20,
      ),
    );
  }
}
