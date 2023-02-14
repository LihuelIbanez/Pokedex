import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class GalleryOfPokemonController extends GetxController
    with StateMixin<Pokemon> {
  late RxList<Pokemon?> pokemonList = <Pokemon>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Pokemon> get pokemonListValue => pokemonList.value as List<Pokemon>;

  late TextEditingController searchController;
  late TextEditingController firstPokemonController;
  late TextEditingController secondPokemonController;

  final RxBool _isComparationEnable = false.obs;
  bool get isComparationEnableValue => _isComparationEnable.value;
  final RxBool isOpen = false.obs;
  bool get isOpenValue => isOpen.value;

  final scrollController = ScrollController();
  int pageNumber = 0;
  @override
  void onInit() async {
    super.onInit();
    await loadPokemonList();
    searchController = TextEditingController();
    firstPokemonController = TextEditingController();
    secondPokemonController = TextEditingController();
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
    TextEditingController().dispose();
    scrollController.dispose();
    searchController.dispose();
    firstPokemonController.dispose();
    secondPokemonController.dispose();
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

  void goToPokemonVersusPage() {
    int first = (firstPokemonController.value.text.isNotEmpty)
        ? int.parse(firstPokemonController.value.text)
        : 1;
    int second = (secondPokemonController.value.text.isNotEmpty)
        ? int.parse(secondPokemonController.value.text)
        : 1;
    Get.toNamed(Routes.pokemonVersus, arguments: [first, second]);
  }

  void searchPokemon() {
    if (searchController.text.isNotEmpty) {
      int id = int.parse(searchController.text);
      if (id > 0 && id < 898) {
        Get.toNamed(Routes.pokemonStats, arguments: [id]);
      }
    } else {
      loadPokemonList();
    }
  }

  void comparationCheckEnable() {
    _isComparationEnable.value = firstPokemonController.text.isNotEmpty &&
        secondPokemonController.text.isNotEmpty;
  }
}
