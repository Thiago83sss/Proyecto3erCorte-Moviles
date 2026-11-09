import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonListTile extends StatelessWidget {
  final PokemonSummary pokemon;
  final VoidCallback onTap;

  const PokemonListTile(
      {super.key, required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListTile(
        onTap: onTap,
        leading: Image.network(
          pokemon.spriteUrl,
          width: 56,
          height: 56,
          errorBuilder: (_, __, ___) => const Icon(Icons.catching_pokemon),
        ),
        title: Text(pokemon.displayName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('#${pokemon.id.toString().padLeft(3, '0')}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}