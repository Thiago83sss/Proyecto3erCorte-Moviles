String prettyName(String name) {
  final clean = name.replaceAll('-', ' ');
  return clean[0].toUpperCase() + clean.substring(1);
}

class Pokemon {
  final int id;
  final String name;
  final String? image;
  final List<String> types;
  final int height;
  final int weight; 
  final Map<String, int> stats;

  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final art =
        json['sprites']?['other']?['official-artwork']?['front_default']
            as String?;
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      image: art ?? json['sprites']?['front_default'] as String?,
      types: (json['types'] as List)
          .map<String>((t) => t['type']['name'] as String)
          .toList(),
      height: json['height'] as int,
      weight: json['weight'] as int,
      stats: {
        for (final s in json['stats'] as List)
          s['stat']['name'] as String: s['base_stat'] as int,
      },
    );
  }

  String get displayName => prettyName(name);
  double get heightM => height / 10;
  double get weightKg => weight / 10;
}

class PokemonSummary {
  final int id;
  final String name;

  const PokemonSummary({required this.id, required this.name});

  String get displayName => prettyName(name);
  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}