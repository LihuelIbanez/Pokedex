import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';

class GalleryOfPokemonBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryOfPokemonController>(
      () => GalleryOfPokemonController(),
    );
  }
}
