import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';

class PokemonStatsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonStatsController>(
      () => PokemonStatsController(),
    );
  }
}
