import 'package:get/get.dart';

import '../presentation/controllers/pokemon_abilitys_controller.dart';

class PokemonAbilitysBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<PokemonAbilityController>(
      PokemonAbilityController(),
    );
  }
}
