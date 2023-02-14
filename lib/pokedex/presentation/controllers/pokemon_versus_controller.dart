import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonVersusController extends GetxController with StateMixin<Pokemon> {
  final List<Pokemon> _pokemonList = <Pokemon>[].obs;
  List<Pokemon> get pokemonListValue => _pokemonList;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    super.onInit();
    var data = Get.arguments;
    getPokemonStats(data[0]);
    getPokemonStats(data[1]);
  }

  @override
  void onReady() async {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {}

  Future getPokemonStats(int value) async {
    PokeAPI.getPokemonStats(value).then((response) {
      _pokemonList.add(StatsModel.fromJson(json.decode(response.body)));
      Future.delayed(const Duration(seconds: 1));
    });
  }
}
