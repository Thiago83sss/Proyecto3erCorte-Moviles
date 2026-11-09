import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/guide_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pokedex_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokéCocina',
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    PokedexScreen(),
    GuideScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.casino), label: 'Al azar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.catching_pokemon), label: 'Pokédex'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Cocina'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: 'Acerca de'),
        ],
      ),
    );
  }
}