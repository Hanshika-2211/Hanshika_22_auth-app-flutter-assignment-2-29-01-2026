import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  // Change this to your backend URL when running on a real device
  // For iOS Simulator: http://localhost:3000
  // For Android Emulator: http://10.0.2.2:3000
  // For real device: http://YOUR_IP_ADDRESS:3000
  static const String baseUrl = 'http://localhost:3000/api';

  Future<List<Book>> getBooks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/books'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> jsonData = responseData['data'];
        return jsonData.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }

  Future<Book> getBookById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/books/$id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Book.fromJson(responseData['data']);
      } else {
        throw Exception('Failed to load book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching book: $e');
    }
  }

  Future<Book> createBook(Book book) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/books'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(book.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Book.fromJson(responseData['data']);
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to create book');
      }
    } catch (e) {
      throw Exception('Error creating book: $e');
    }
  }

  Future<Book> updateBook(String id, Book book) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/books/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(book.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Book.fromJson(responseData['data']);
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to update book');
      }
    } catch (e) {
      throw Exception('Error updating book: $e');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/books/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting book: $e');
    }
  }
}
