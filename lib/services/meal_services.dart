import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/meal.dart';

class MealService {
  static const String _base = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Meal>> byIngredient(String ingredient) async {
    final res =
        await http.get(Uri.parse('$_base/filter.php?i=$ingredient'));
    if (res.statusCode != 200) {
      throw Exception('No se pudieron cargar las recetas.');
    }
    final meals = json.decode(res.body)['meals'];
    if (meals == null) return [];
    return (meals as List)
        .map((m) => Meal.fromJson(m as Map<String, dynamic>))
        .take(4)
        .toList();
  }
}