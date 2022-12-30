import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/bindings/gallery_of_pokemon_bindings.dart';
import 'package:pokedex_flutter/pokedex/bindings/pokemon_stats_bindings.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/gallery_of_pokemon_page.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/pokemon_stats_page.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/splash_screen_page.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const pokemonGallery = '/gallery';
  static const pokemonStats = '/pokemon_stats';
}

class Pages {
  static final pages = [
    GetPage(
        name: Routes.pokemonGallery,
        page: (() => const GalleryOFPokemonPage()),
        binding: GalleryOfPokemonBindings()),
    GetPage(
        name: Routes.pokemonStats,
        page: (() => const PokemonStatsPage()),
        binding: PokemonStatsBindings()),
    GetPage(
      name: Routes.splashScreen,
      page: (() => const SplashScreen()),
    ),
  ];
}
