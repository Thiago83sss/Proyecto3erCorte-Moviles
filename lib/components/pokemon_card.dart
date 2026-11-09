import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../theme/app_theme.dart';
import 'type_chip.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.colorOf(pokemon.types.first);

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withOpacity(0.35), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Text(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              style: const TextStyle(
                  color: Colors.black45, fontWeight: FontWeight.bold),
            ),
            if (pokemon.image != null)
              Image.network(
                pokemon.image!,
                height: 200,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image,
                    size: 80, color: Colors.black38),
              )
            else
              const Icon(Icons.help_outline, size: 80),
            Text(
              pokemon.displayName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children:
                  pokemon.types.map((t) => TypeChip(type: t)).toList(),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _info('${pokemon.heightM.toStringAsFixed(1)} m', 'Altura'),
                _info('${pokemon.weightKg.toStringAsFixed(1)} kg', 'Peso'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}