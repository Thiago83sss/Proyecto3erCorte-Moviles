import 'package:flutter/material.dart';

import '../models/meal.dart';

class RecipeTile extends StatelessWidget {
  final Meal meal;
  const RecipeTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            meal.thumb,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.restaurant),
          ),
        ),
        title: Text(meal.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}