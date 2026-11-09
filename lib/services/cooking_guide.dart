import '../models/pokemon.dart';

class TypeCooking {
  final String method;
  final String flavor;
  final String side;
  final String ingredient;

  const TypeCooking(this.method, this.flavor, this.side, this.ingredient);
}

class SizeCooking {
  final String label;
  final String range;
  final String dish;
  final String portions;
  final String time;

  const SizeCooking(
      this.label, this.range, this.dish, this.portions, this.time);
}

class CookingPlan {
  final String typeKey;
  final TypeCooking type;
  final SizeCooking size;

  const CookingPlan(
      {required this.typeKey, required this.type, required this.size});
}

class CookingGuide {
  static const Map<String, TypeCooking> byType = {
    'normal': TypeCooking('Guisado casero a fuego medio',
        'Suave y reconfortante', 'papas y zanahoria', 'Chicken'),
    'fire': TypeCooking('Parrilla a las brasas', 'Ahumado y picante',
        'ají y pimientos asados', 'Pork'),
    'water': TypeCooking('Al vapor o ceviche', 'Fresco y cítrico',
        'limón, cilantro y cebolla morada', 'Salmon'),
    'grass': TypeCooking('Salteado en wok', 'Herbal y fresco',
        'hierbas, ajo y verduras verdes', 'Spinach'),
    'electric': TypeCooking('Salteado relámpago a fuego alto',
        'Intenso y con chispa', 'jengibre y pimienta', 'Prawns'),
    'ice': TypeCooking('Servido frío en crema o sopa', 'Suave y helado',
        'papa y crema', 'Potatoes'),
    'fighting': TypeCooking('Estofado largo para ablandar el músculo',
        'Robusto y potente', 'frijoles y arroz', 'Beef'),
    'poison': TypeCooking('Adobo ácido y cocción lenta',
        'Fuerte y especiado', 'vinagre, comino y champiñones', 'Mushrooms'),
    'ground': TypeCooking('Cazuela de barro al horno',
        'Terroso y sustancioso', 'arroz y maíz', 'Rice'),
    'flying': TypeCooking('Al horno con piel crocante', 'Ligero y dorado',
        'limón y romero', 'Chicken'),
    'psychic': TypeCooking('Cocción delicada a baja temperatura',
        'Sutil y elegante', 'hierbas finas y mantequilla', 'Eggs'),
    'bug': TypeCooking('Frito crujiente tipo tempura', 'Crocante y salado',
        'salsa de soya y sésamo', 'Prawns'),
    'rock': TypeCooking('Asado sobre piedra caliente', 'Rústico y mineral',
        'sal gruesa y romero', 'Lamb'),
    'ghost': TypeCooking('Salsa roja a fuego lento',
        'Misterioso y ligeramente ácido', 'tomate, ajo y albahaca',
        'Tomatoes'),
    'dragon': TypeCooking('Horneado lento con especias',
        'Épico, intenso y picante', 'curry y especias', 'Lamb'),
    'dark': TypeCooking('Braseado en salsa oscura', 'Profundo y agridulce',
        'salsa de soya y cebolla caramelizada', 'Beef'),
    'steel': TypeCooking('Plancha metálica bien caliente',
        'Salado y firme', 'sal en escamas y pimienta negra', 'Pork'),
    'fairy': TypeCooking('Horneado suave tipo soufflé',
        'Dulce y delicado', 'miel, limón y frutos rojos', 'Eggs'),
  };

  static const List<SizeCooking> sizes = [
    SizeCooking('Pequeño', '< 10 kg', 'Entrada o bocado',
        '3 a 4 por persona', '5 a 10 min'),
    SizeCooking('Mediano', '10 a 60 kg', 'Plato fuerte individual',
        '1 por persona', '20 a 40 min'),
    SizeCooking('Grande', '60 a 200 kg', 'Asado para compartir',
        'Alimenta de 6 a 8 personas', '2 a 3 horas'),
    SizeCooking('Gigante', '> 200 kg', 'Banquete comunitario',
        'Alimenta a más de 20 personas', '6 horas o más'),
  ];

  static SizeCooking sizeOf(Pokemon p) {
    final kg = p.weightKg;
    if (kg < 10) return sizes[0];
    if (kg < 60) return sizes[1];
    if (kg < 200) return sizes[2];
    return sizes[3];
  }

  static CookingPlan planFor(Pokemon p) {
    final key = p.types.first;
    return CookingPlan(
      typeKey: key,
      type: byType[key] ?? byType['normal']!,
      size: sizeOf(p),
    );
  }
}