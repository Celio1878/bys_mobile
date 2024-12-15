import 'package:app/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final user = userState.user;

    var currentRoute = ModalRoute.of(context)!.settings.name;

    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                if (currentRoute != "/") {
                  Navigator.of(context).pushReplacementNamed(
                    "/",
                  );
                }
              },
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
              onPressed: () {},
              icon: const Icon(Icons.web_asset_rounded),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: user != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                    )
                  : const Icon(Icons.person),
              onPressed: () {
                if (user != null && currentRoute != "/profile") {
                  Navigator.of(context).pushReplacementNamed("/profile");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
