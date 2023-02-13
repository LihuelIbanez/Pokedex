import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class GalleryOfPokemonController extends GetxController
    with StateMixin<Pokemon> {
  var isDateLoadCompleted = false.obs;
  late RxList<Pokemon?> pokemonList = <Pokemon>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Pokemon> get pokemonListValue => pokemonList.value as List<Pokemon>;

  final scrollController = ScrollController();
  int pageNumber = 0;
  @override
  void onInit() async {
    super.onInit();
    await loadPokemonList();
    scrollController.addListener((() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageNumber++;
        loadPokemonList();
      }
    }));
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future loadPokemonList() async {
    PokeAPI.getPokemons(20, pageNumber).then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      pokemonList.addAll(data.map<Pokemon>((element) {
        return PokemonModels.fromJson(element);
      }).toList());
      change(null, status: RxStatus.success());
    });
  }

  void goToPokemonStatsPage(int id, Pokemon pokemon) {
    Get.toNamed(Routes.pokemonStats, arguments: [id, pokemon]);
  }

  Future loadStatsPokemon(int id) async {
    PokeAPI.getPokemonStats(id).then((response) {
      Pokemon pokemon = PokemonModels.fromJson(json.decode(response.body));
      return pokemon;
    });
  }
}
