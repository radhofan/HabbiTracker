import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  static Future<Map<String, dynamic>> getHabit(int habitId) async {
    final url = Uri.parse('$_baseUrl/habits/$habitId');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch habit: ${response.body}');
    }

    return jsonDecode(response.body); // ✅ Make sure this RETURN exists!
  }


  static Future<Map<String, dynamic>> updateHabit(int habitId, Map<String, dynamic> updatedData) async {
    final url = Uri.parse('$_baseUrl/habits/$habitId');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update habit: ${response.body}');
    }
  }

  static Future<String> deleteHabit(int habitId) async {
    final url = Uri.parse('$_baseUrl/habits/$habitId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return response.body;  // Return response body as String
    } else {
      throw Exception('Failed to delete habit: ${response.body}');
    }
  }

  static Future<List<dynamic>> getHabitsByUser(int userId) async {
    final url = Uri.parse('$_baseUrl/users/$userId/habits');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch habits for user: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> createHabitForUser(int userId, Map<String, dynamic> habitData) async {
    final url = Uri.parse('$_baseUrl/users/$userId/habits');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(habitData),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create habit for user: ${response.body}');
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  // POST /login
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid credentials: ${response.body}');
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  // POST /users
  static Future<Map<String, dynamic>> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/users');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.body}');
    }
  }

}
