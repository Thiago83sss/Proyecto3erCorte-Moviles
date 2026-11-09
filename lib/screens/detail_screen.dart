import 'package:flutter/material.dart';

import '../components/cooking_section.dart';
import '../components/pokemon_card.dart';
import '../components/section_title.dart';
import '../components/stat_bar.dart';
import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatefulWidget {
  final int pokemonId;
  const DetailScreen({super.key, required this.pokemonId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const Map<String, String> _statNames = {
    'hp': 'PS',
    'attack': 'Ataque',
    'defense': 'Defensa',
    'special-attack': 'Atq. especial',
    'special-defense': 'Def. especial',
    'speed': 'Velocidad',
  };

  late final Future<Pokemon> _future =
      PokeApiService().getPokemon(widget.pokemonId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: FutureBuilder<Pokemon>(
        future: _future,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Center(child: Text('No se pudo cargar el Pokémon.'));
          }
          final p = snap.data!;
          final color = AppTheme.colorOf(p.types.first);
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  PokemonCard(pokemon: p),
                  const SectionTitle(
                      icon: Icons.bar_chart, text: 'Estadísticas base'),
                  ...p.stats.entries.map((e) => StatBar(
                        label: _statNames[e.key] ?? e.key,
                        value: e.value,
                        color: color,
                      )),
                  const SizedBox(height: 16),
                  CookingSection(key: ValueKey(p.id), pokemon: p),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}