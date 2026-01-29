import "package:flutter/material.dart";

import "../models/user.dart";

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          Text("Profile Screen"),
          Text(user.id),
          Text(user.name),
          Text(user.username),
          Text(user.email),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            child: Text("Home"),
          ),
        ],
      ),
    );
  }
}
