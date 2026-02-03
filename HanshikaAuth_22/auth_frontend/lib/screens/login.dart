import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../services/user_service.dart';
import '../models/user.dart';
import '../utils/custom_alert_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      CustomAlertBox.showWarning(context, 'Warning', 'Please fill in all fields');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await UserService.login(
        usernameController.text,
        passwordController.text,
      );

      if (!mounted) return;

      if (response['message'] == 'Login successful') {
        String token = response['token'];
        Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
        
        User user = User(
          id: decodedToken['userId'],
          name: decodedToken['name'],
          username: decodedToken['username'],
          email: decodedToken['email'],
          password: "",
        );

        await CustomAlertBox.showSuccess(context, 'Success', response['message']);
        
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context, 
          '/profile', 
          (route) => false,
          arguments: user,
        );
      } else {
        CustomAlertBox.showError(context, 'Error', response['message']);
      }
    } catch (e) {
      if (!mounted) return;
      CustomAlertBox.showError(context, 'Error', 'Something went wrong: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Icon(
                  Icons.lock_person_outlined,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 24),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign in to continue",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : handleLogin,
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text("Login"),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}