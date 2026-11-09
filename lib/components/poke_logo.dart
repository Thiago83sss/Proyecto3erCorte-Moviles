import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PokeLogo extends StatelessWidget {
  final double size;
  const PokeLogo({super.key, this.size = 64});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pokeball.png',
      width: size,
      height: size,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.catching_pokemon, size: size, color: AppTheme.red),
    );
  }
}