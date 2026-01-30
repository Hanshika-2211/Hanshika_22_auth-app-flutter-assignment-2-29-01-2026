import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/signup_request.dart';

class AuthService {
  static const String baseUrl = 'http://localhost:3000/api/auth';

  // Signup
  Future<AuthResponse> signup(SignupRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        // Save token
        await _saveToken(data['token']);
        return AuthResponse.fromJson(data);
      } else {
        return AuthResponse.error(data['message'] ?? 'Signup failed');
      }
    } catch (e) {
      return AuthResponse.error('Connection error: $e');
    }
  }

  // Login
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Save token
        await _saveToken(data['token']);
        return AuthResponse.fromJson(data);
      } else {
        return AuthResponse.error(data['message'] ?? 'Login failed');
      }
    } catch (e) {
      return AuthResponse.error('Connection error: $e');
    }
  }

  // Save token
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Get token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Check if logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
