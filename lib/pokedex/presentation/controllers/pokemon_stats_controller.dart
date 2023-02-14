import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonStatsController extends GetxController
    with StateMixin<Description> {
  PokemonStatsController();

  final _pokemon = const Pokemon().obs;
  Pokemon get pokemonValue => _pokemon.value;
  final _description = const Description().obs;
  Description get descriptionValue => _description.value;
  final _id = 0.obs;
  int get idValue => _id.value;
  final _typeColor =
      <Color>[ColorsPokemon.typeNormal, ColorsPokemon.typeNormal].obs;
  List<Color> get typeColorValue => _typeColor;

  @override
  void onInit() async {
    super.onInit();
    _id.value = Get.arguments[0];
    await getPokemonStats();
    await getPokemonDescription();
  }

  Future getPokemonStats() async {
    PokeAPI.getPokemonStats(idValue).then((response) {
      _pokemon.value = StatsModel.fromJson(json.decode(response.body));
      Future.delayed(const Duration(seconds: 1));
    });
  }

  Future getPokemonDescription() async {
    PokeAPI.getPokemonDescription(idValue).then((response) {
      _description.value =
          DescriptionModel.fromJson(json.decode(response.body));
      Future.delayed(const Duration(seconds: 1));
      change(null, status: RxStatus.success());
    });
  }
}
