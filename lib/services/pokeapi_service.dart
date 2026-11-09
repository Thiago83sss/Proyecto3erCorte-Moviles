import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokeApiService {
  static const String _base = 'https://pokeapi.co/api/v2';
  static const int _maxId = 1025;
  final Random _random = Random();

  Future<Pokemon> getPokemon(Object idOrName) async {
    final res = await http.get(Uri.parse('$_base/pokemon/$idOrName'));
    if (res.statusCode != 200) {
      throw Exception('No se pudo obtener el Pokémon (${res.statusCode}).');
    }
    return Pokemon.fromJson(json.decode(res.body) as Map<String, dynamic>);
  }

  /// Función random: Pokémon aleatorio.
  Future<Pokemon> getRandom() => getPokemon(_random.nextInt(_maxId) + 1);

  Future<List<PokemonSummary>> getList({int limit = 151}) async {
    final res = await http.get(Uri.parse('$_base/pokemon?limit=$limit'));
    if (res.statusCode != 200) {
      throw Exception('No se pudo cargar la Pokédex.');
    }
    final results = json.decode(res.body)['results'] as List;
    return List.generate(
      results.length,
      (i) => PokemonSummary(id: i + 1, name: results[i]['name'] as String),
    );
  }
}