import 'package:get/get.dart';
import 'package:pokedex_flutter/core/use%20cases/inyector_factory.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_list_usecase.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';

class GalleryOfPokemonBindings extends Bindings {
  @override
  void dependencies() {
    final PokemonRepository repository =
        InjectorFactory.createPokemonRepository();
    final GetPokemonList pokemonListUseCase = GetPokemonList(repository);

    Get.lazyPut<GalleryOfPokemonController>(
      () => GalleryOfPokemonController(
        pokemonListUseCase: pokemonListUseCase,
      ),
    );
  }
}
