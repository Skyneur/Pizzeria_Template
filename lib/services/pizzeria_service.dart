import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pizza.dart';

class PizzeriaService {
  // URL du web service
  static const String baseUrl =
      'http://localhost/api/pizzas/';

  // Fonction pour récupérer les pizzas depuis le web service
  Future<List<Pizza>> fetchPizzas() async {
    try {
      print('Fetching pizzas from $baseUrl');
      final response = await http.get(Uri.parse(baseUrl));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map<Pizza>((json) => Pizza.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load pizzas: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching pizzas: $e');
      throw Exception('Error fetching pizzas: $e');
    }
  }
}
