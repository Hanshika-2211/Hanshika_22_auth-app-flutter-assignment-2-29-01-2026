import 'user.dart';

class AuthResponse {
  final bool success;
  final String? message;
  final String? token;
  final User? user;

  AuthResponse({required this.success, this.message, this.token, this.user});

  // Create AuthResponse from JSON (for successful responses)
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: true,
      message: json['message'],
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Create AuthResponse for errors
  factory AuthResponse.error(String message) {
    return AuthResponse(success: false, message: message);
  }

  @override
  String toString() {
    return 'AuthResponse(success: $success, message: $message, token: ${token != null ? '***' : null}, user: $user)';
  }
}
