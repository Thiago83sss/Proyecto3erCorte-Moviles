import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.colorOf(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        AppTheme.nameOf(type),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}