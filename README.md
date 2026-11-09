# PokéCocina

Aplicación móvil y web hecha con **Flutter** que funciona como una Pokédex: saca un Pokémon al azar y, a continuación, muestra una guía divertida de cómo "cocinarlo" como platillo según su **tipo** y su **tamaño**, junto con recetas reales.

> Proyecto académico. Ningún Pokémon real es cocinado.

## Funcionalidades

- Pokémon aleatorio con imagen, tipos, altura y peso.
- Guía de cocina por tipo (método, sabor y acompañamiento) y por tamaño (platillo, porciones y tiempo).
- Recetas reales sugeridas desde una segunda API.
- Pokédex con buscador y pantalla de detalle con estadísticas base.
- Navegación con barra inferior de 4 pantallas.

## APIs utilizadas

| API | Uso |
|---|---|
| [PokéAPI](https://pokeapi.co) | Datos e imágenes de los Pokémon |
| [TheMealDB](https://www.themealdb.com/api.php) | Recetas reales por ingrediente |

## Estructura del proyecto

```
lib/
├── main.dart
├── components/   # Widgets personalizados reutilizables
├── models/       # Pokemon, PokemonSummary, Meal
├── screens/      # Al azar, Pokédex, Detalle, Guía, Acerca de
├── services/     # Consumo de APIs y lógica de cocina
└── theme/        # Colores y tema
assets/images/    # Imágenes locales
```

## Instalación

```bash
git clone <https://github.com/Thiago83sss/Proyecto3erCorte-Moviles.git>
cd <proyectada3ercorte>
flutter pub get
flutter run
```

## Manual de uso

1. **Al azar:** toca "¡Pokémon al azar!". Aparece el Pokémon y, debajo, cómo cocinarlo y recetas sugeridas.
2. **Pokédex:** busca por nombre o número y toca un Pokémon para ver su detalle.
3. **Cocina:** consulta la guía completa por tamaño y por tipo.
4. **Acerca de:** información del proyecto y de las APIs.

### Cómo se decide la cocción

- **Tamaño (por peso):** Pequeño (< 10 kg), Mediano (10 a 60 kg), Grande (60 a 200 kg), Gigante (> 200 kg).
- **Tipo (el primero del Pokémon):** define el método, el sabor, el acompañamiento y el ingrediente sustituto para buscar recetas.

## Despliegue (web)

```bash
flutter build web --release
cd build/web
vercel --prod
```

- Repositorio: <https://github.com/Thiago83sss/Proyecto3erCorte-Moviles.git>
- App en línea: <URL_DE_VERCEL>


## Autores

<Ivan Romero, Danna González> | <Universidad de San Buenaventura>