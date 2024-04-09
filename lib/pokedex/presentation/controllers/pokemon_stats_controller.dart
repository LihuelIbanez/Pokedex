import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_description_usecase.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_stats_usecase.dart';

class PokemonStatsController extends GetxController with StateMixin<Pokemon> {
  PokemonStatsController(
      {required this.getPokemonStatsUseCase,
      required this.getPokemonDescriptionUseCase});

  final GetPokemonStats getPokemonStatsUseCase;
  final GetPokemonDescription getPokemonDescriptionUseCase;

  final Rx<Pokemon> _pokemon = const Pokemon().obs;
  Pokemon get pokemonValue => _pokemon.value;
  final _description = const Description().obs;
  Description get descriptionValue => _description.value;
  final _id = 0.obs;
  int get idValue => _id.value;
  final _typeColor =
      <Color>[ColorsPokemon.typeNormal, ColorsPokemon.typeNormal].obs;
  List<Color> get typeColorValue => _typeColor;

  final RxString _showStatName = 'HP'.obs;
  String get showStatName => _showStatName.value;

  final RxInt _showStatValue = 0.obs;
  int get showStatValue => _showStatValue.value;

  final Rx<Color> _color = Colors.green.obs;
  Color get color => _color.value;

  final ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void onInit() async {
    super.onInit();
    _id.value = Get.arguments[0];
    await getPokemonStats();
    await getPokemonDescription();
  }

  String description() {
    final String fullLenght = _description.value.description ?? '';
    if (fullLenght.length <= 100) {
      return fullLenght;
    }
    return '${fullLenght.substring(0, 100)}...';
  }

  Future getPokemonStats() async {
    try {
      final result = await getPokemonStatsUseCase(GetPokemonParams(idValue));
      result.fold((l) {
        change(null, status: RxStatus.error());
      }, (r) {
        _pokemon.value = r;
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  Future getPokemonDescription() async {
    try {
      final result =
          await getPokemonDescriptionUseCase(GetPokemonParams(idValue));
      result.fold((l) {
        change(null, status: RxStatus.error());
      }, (r) {
        _description.value = r;
        _showStatValue.value = _pokemon.value.hp!;
        change(null, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void setupStats(String statName, int statValue, Color color) {
    _showStatName.value = statName;
    _showStatValue.value = statValue;
    _color.value = color;
    valueNotifier.value = statValue.toDouble();
  }
}
