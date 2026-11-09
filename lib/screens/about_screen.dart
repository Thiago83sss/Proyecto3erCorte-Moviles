import 'package:flutter/material.dart';

import '../components/poke_logo.dart';
import '../components/section_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Center(child: PokeLogo(size: 96)),
          SizedBox(height: 12),
          Center(
            child: Text('PokéCocina',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          ),
          SizedBox(height: 16),
          Text(
            'Pokédex con un Pokémon aleatorio y una guía divertida para '
            '"cocinarlo" según su tipo y su tamaño. Es un proyecto '
            'académico: ningún Pokémon real es cocinado.',
          ),
          SectionTitle(icon: Icons.cloud, text: 'APIs utilizadas'),
          Text('• PokéAPI (pokeapi.co): datos e imágenes de Pokémon.\n'
              '• TheMealDB (themealdb.com): recetas reales por ingrediente.'),
          SectionTitle(icon: Icons.help_outline, text: 'Cómo se usa'),
          Text('1. En "Al azar" toca el botón para sacar un Pokémon.\n'
              '2. Baja para ver cómo cocinarlo y las recetas sugeridas.\n'
              '3. En "Pokédex" busca y abre cualquier Pokémon.\n'
              '4. En "Cocina" consulta la guía completa por tipo y tamaño.'),
        ],
      ),
    );
  }
}