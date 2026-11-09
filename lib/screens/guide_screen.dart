import 'package:flutter/material.dart';

import '../components/section_title.dart';
import '../services/cooking_guide.dart';
import '../theme/app_theme.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guía de cocina')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(icon: Icons.straighten, text: 'Por tamaño (peso)'),
          ...CookingGuide.sizes.map(
            (s) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.red,
                  foregroundColor: Colors.white,
                  child: Text(s.label[0]),
                ),
                title: Text('${s.label} · ${s.range}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${s.dish}\n${s.portions} · ${s.time}'),
                isThreeLine: true,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(icon: Icons.category, text: 'Por tipo'),
          ...CookingGuide.byType.entries.map(
            (e) => Card(
              child: ExpansionTile(
                leading: CircleAvatar(
                    radius: 12, backgroundColor: AppTheme.colorOf(e.key)),
                title: Text(AppTheme.nameOf(e.key),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                children: [
                  ListTile(
                      dense: true, title: Text('Método: ${e.value.method}')),
                  ListTile(
                      dense: true, title: Text('Sabor: ${e.value.flavor}')),
                  ListTile(
                      dense: true,
                      title: Text('Acompañar con: ${e.value.side}')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}