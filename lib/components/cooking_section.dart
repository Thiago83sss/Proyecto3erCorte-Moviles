import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/pokemon.dart';
import '../services/cooking_guide.dart';
import '../services/meal_services.dart';
import '../theme/app_theme.dart';
import 'recipe_tile.dart';
import 'section_title.dart';

class CookingSection extends StatefulWidget {
  final Pokemon pokemon;
  const CookingSection({super.key, required this.pokemon});

  @override
  State<CookingSection> createState() => _CookingSectionState();
}

class _CookingSectionState extends State<CookingSection> {
  final MealService _service = MealService();
  late final CookingPlan _plan = CookingGuide.planFor(widget.pokemon);

  List<Meal> _meals = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    try {
      final meals = await _service.byIngredient(_plan.type.ingredient);
      if (!mounted) return;
      setState(() {
        _meals = meals;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'No se pudieron cargar las recetas.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = _plan.size;
    final type = _plan.type;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          icon: Icons.restaurant_menu,
          text: '¿Cómo cocinar a ${widget.pokemon.displayName}?',
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _row(Icons.straighten, 'Tamaño',
                    '${size.label} (${size.range})'),
                _row(Icons.dinner_dining, 'Platillo', size.dish),
                _row(Icons.groups, 'Porciones', size.portions),
                _row(Icons.timer, 'Tiempo', size.time),
                const Divider(),
                _row(Icons.local_fire_department,
                    'Método (tipo ${AppTheme.nameOf(_plan.typeKey)})',
                    type.method),
                _row(Icons.restaurant, 'Sabor', type.flavor),
                _row(Icons.eco, 'Acompañar con', type.side),
                const SizedBox(height: 8),
                const Text(
                  'Es un juego: ningún Pokémon real fue cocinado. '
                  'Las recetas usan un ingrediente sustituto.',
                  style: TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        SectionTitle(
          icon: Icons.menu_book,
          text: 'Recetas reales (ingrediente: ${type.ingredient})',
        ),
        if (_loading)
          const Center(child: CircularProgressIndicator())
        else if (_error != null)
          Text(_error!, style: const TextStyle(color: Colors.red))
        else if (_meals.isEmpty)
          const Text('No hay recetas para este ingrediente.')
        else
          ..._meals.map((m) => RecipeTile(meal: m)),
      ],
    );
  }

  Widget _row(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppTheme.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}