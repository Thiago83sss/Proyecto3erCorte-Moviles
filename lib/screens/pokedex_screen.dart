import 'package:flutter/material.dart';

import '../components/pokemon_list_tile.dart';
import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';
import 'detail_screen.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final PokeApiService _api = PokeApiService();
  late Future<List<PokemonSummary>> _future;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _future = _api.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar por nombre o número',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PokemonSummary>>(
              future: _future,
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('No se pudo cargar la Pokédex.'),
                        TextButton(
                          onPressed: () =>
                              setState(() => _future = _api.getList()),
                          child: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }
                final list = snap.data!
                    .where((p) =>
                        p.name.contains(_query) || p.id.toString() == _query)
                    .toList();
                if (list.isEmpty) {
                  return const Center(child: Text('Sin resultados'));
                }
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) => PokemonListTile(
                    pokemon: list[i],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(pokemonId: list[i].id),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}