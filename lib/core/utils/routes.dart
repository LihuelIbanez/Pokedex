import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/bindings/gallery_of_pokemon_bindings.dart';
import 'package:pokedex_flutter/pokedex/bindings/pokemon_stats_bindings.dart';
import 'package:pokedex_flutter/pokedex/bindings/pokemon_versus_bindings.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/gallery_of_pokemon_page.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/pokemon_stats_page.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/pokemon_versus_page.dart';
import 'package:pokedex_flutter/pokedex/presentation/screens/splash_screen_page.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const pokemonGallery = '/gallery';
  static const pokemonStats = '/pokemon_stats';
  static const pokemonVersus = '/pokemon_versus';
  static const pokemonAbilitys = '/pokemon_abilitys';
}

class Pages {
  static final pages = [
    GetPage(
        name: Routes.pokemonGallery,
        page: (() => const GalleryOfPokemonPage()),
        binding: GalleryOfPokemonBindings()),
    GetPage(
        name: Routes.pokemonStats,
        page: (() => const PokemonStatsPage()),
        binding: PokemonStatsBindings()),
    GetPage(
        name: Routes.pokemonVersus,
        page: (() => const PokemonVersusPage()),
        binding: PokemonVersusBindings()),
    GetPage(
      name: Routes.splashScreen,
      page: (() => const SplashScreen()),
    ),
    // GetPage(
    //     name: Routes.pokemonAbilitys,
    //     page: (() => const PokemonAbilityPage()),
    //     binding: PokemonAbilitysBindings()),
  ];
}
