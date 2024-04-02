import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_stats_usecase.dart';

class PokemonVersusController extends GetxController with StateMixin<Pokemon> {
  final List<Pokemon> _pokemonList = <Pokemon>[].obs;
  List<Pokemon> get pokemonListValue => _pokemonList;

  PokemonVersusController({required this.getPokemonStatsUseCase});

  final GetPokemonStats getPokemonStatsUseCase;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    var data = Get.arguments;
    await getPokemonStats(data[0]);
    await getPokemonStats(data[1]);
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {}

  Future getPokemonStats(int value) async {
    try {
      final result = await getPokemonStatsUseCase(GetPokemonParams(value));
      result.fold((l) {
        null;
      }, (r) {});
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
