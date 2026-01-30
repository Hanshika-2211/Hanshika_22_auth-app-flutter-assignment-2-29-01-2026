import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user.dart';
import '../utils/custom_alert_box.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{

  final usernameController = TextEditingController();
  final passwordController = TextEditingController(); 

  void handleLogin() async {

    final Map<String, dynamic> response =
        await UserService.login(
          usernameController.text,
          passwordController.text,
        );

    print(response);

    if (response['message'] == 'Login Successful') {

      String token = response['token'].toString();

      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(token);

      print('Decoded Token: $decodedToken');

      User user = User(
        id: decodedToken['userid'],
        name: decodedToken['name'],
        username: decodedToken['username'],
        email: decodedToken['email'],
        password: '',
      );

      CustomAlertBox.showAlert(
        context,
        title: 'Success',
        message: response['message'].toString(),
      );

      Navigator.pushNamed(
        context,
        '/profile',
        arguments: user,
      );

    } else {

      CustomAlertBox.showAlert(
        context,
        title: 'Error',
        message: response['message'].toString(),
      );

    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
          
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                icon: Icon(Icons.person),
              ),
            ),
  
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                icon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: handleLogin,
              child: Text("Login"),
            )

          ],
        ),
      ),
    );
  }
}
