import 'package:flutter/material.dart';

import '../components/cooking_section.dart';
import '../components/poke_logo.dart';
import '../components/pokemon_card.dart';
import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokeApiService _api = PokeApiService();
  Pokemon? _pokemon;
  bool _loading = false;
  String? _error;

  Future<void> _roll() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final p = await _api.getRandom();
      if (!mounted) return;
      setState(() {
        _pokemon = p;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString().replaceFirst('Exception: ', '');
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PokéCocina')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PokeLogo(size: 72),
                const SizedBox(height: 8),
                const Text(
                  '¿Qué Pokémon cocinamos hoy?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _loading ? null : _roll,
                  icon: const Icon(Icons.casino),
                  label: Text(_pokemon == null
                      ? '¡Pokémon al azar!'
                      : 'Otro al azar'),
                ),
                const SizedBox(height: 20),
                if (_loading)
                  const CircularProgressIndicator()
                else if (_error != null)
                  Text(_error!, style: const TextStyle(color: Colors.red))
                else if (_pokemon != null) ...[
                  PokemonCard(pokemon: _pokemon!),
                  const SizedBox(height: 20),
                  CookingSection(
                      key: ValueKey(_pokemon!.id), pokemon: _pokemon!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}