class Meal {
  final String id;
  final String name;
  final String thumb;

  const Meal({required this.id, required this.name, required this.thumb});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json['idMeal'] as String,
        name: json['strMeal'] as String,
        thumb: json['strMealThumb'] as String,
      );
}