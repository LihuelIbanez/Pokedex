import 'dart:convert';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/pokedex/data/models/stats_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/stats.dart';

class PokemonStatsController extends GetxController {
  PokemonStatsController();

  final pokemon = const Pokemon().obs;
  Pokemon get pokemonValue => pokemon.value;
  final id = 0.obs;
  int get idValue => id.value;

  var isDateLoadCompleted = false.obs;
  late Rx<Stats?> pokemonStats = const Stats().obs;
  Stats get pokemonListValue => pokemonStats.value as Stats;

  @override
  void onInit() async {
    super.onInit();
    id.value = Get.arguments[0];
    pokemon.value = Get.arguments[1];
    await loadPokemonStats();
  }

  Future loadPokemonStats() async {
    PokeAPI.getPokemon2Stats().then((response) {
      Map<String, dynamic> data = json.decode(response.body)[pokemon][idValue];
      print(data);
      pokemonStats.value = StatsModels.fromJson(data);
      print(pokemonStats.value);
    });
  }
}
