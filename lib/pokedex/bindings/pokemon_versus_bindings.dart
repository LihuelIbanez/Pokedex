import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_versus_controller.dart';

class PokemonVersusBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonVersusController>(
      () => PokemonVersusController(),
    );
  }
}
