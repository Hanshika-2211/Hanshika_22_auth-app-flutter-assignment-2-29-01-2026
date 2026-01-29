import "dart:async";
import "package:flutter/material.dart";
import "package:jwt_decode/jwt_decode.dart";
import "../models/user.dart";
import "../services/user_service.dart";
import "../screens/custom_alert.dart";

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLogin() async {
    final response = await UserService.login(
      usernameController.text,
      passwordController.text,
    );

    if (response["message"] == "Login successful") {
      String token = response["token"];
      Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
      print("Decoded Token: $decodedToken");

      User user = User(
        id: decodedToken["userId"],
        name: decodedToken["name"],
        username: decodedToken["username"],
        email: decodedToken["email"],
        password: "",
      );
      CustomAlertBox.showSuccess(context, "Success", response["message"]);

      // Add timer delay before navigation
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/profile", arguments: user);
      });
    } else {
      CustomAlertBox.showError(context, "Error", response["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          ElevatedButton(onPressed: handleLogin, child: Text("Login")),
        ],
      ),
    );
  }
}
