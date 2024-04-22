import 'package:get/get.dart';
import 'package:pokedex_flutter/core/use%20cases/inyector_factory.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_description_usecase.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_stats_usecase.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';

class PokemonStatsBindings extends Bindings {
  @override
  void dependencies() {
    final PokemonRepository repository =
        InjectorFactory.createPokemonRepository();
    final GetPokemonStats getPokemonStatsUseCase = GetPokemonStats(repository);
    final GetPokemonDescription getPokemonDescriptionUseCase =
        GetPokemonDescription(repository);

    Get.put<PokemonStatsController>(
      PokemonStatsController(
          getPokemonStatsUseCase: getPokemonStatsUseCase,
          getPokemonDescriptionUseCase: getPokemonDescriptionUseCase),
    );
  }
}
