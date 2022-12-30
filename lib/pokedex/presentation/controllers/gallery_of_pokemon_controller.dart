import 'dart:convert';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class GalleryOfPokemonController extends GetxController {
  var isDateLoadCompleted = false.obs;
  late RxList<Pokemon?> pokemonList = <Pokemon>[].obs;
  List<Pokemon> get pokemonListValue => pokemonList.value as List<Pokemon>;

  @override
  void onInit() async {
    super.onInit();
    await loadPokemonList();
  }

  Future loadPokemonList() async {
    PokeAPI.getPokemons(250).then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      pokemonList.value = data.asMap().entries.map<PokemonModels>((element) {
        element.value['id'] = element.key + 1;
        element.value['name'] = element.value['name'].toString().toUpperCase();
        element.value['img'] =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
        return PokemonModels.fromJson(element.value);
      }).toList();
    });
  }

  void goToPokemonStatsPage(int id, Pokemon pokemon) {
    Get.toNamed(Routes.pokemonStats, arguments: [id, pokemon]);
  }
}
