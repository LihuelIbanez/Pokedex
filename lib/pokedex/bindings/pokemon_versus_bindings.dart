import 'package:get/get.dart';
import 'package:pokedex_flutter/core/use%20cases/inyector_factory.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_stats_usecase.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_versus_controller.dart';

class PokemonVersusBindings extends Bindings {
  @override
  void dependencies() {
    final PokemonRepository repository =
        InjectorFactory.createCancelationsRepository();
    final GetPokemonStats getPokemonStatsUseCase = GetPokemonStats(repository);
    Get.lazyPut<PokemonVersusController>(
      () => PokemonVersusController(
        getPokemonStatsUseCase: getPokemonStatsUseCase,
      ),
    );
  }
}
