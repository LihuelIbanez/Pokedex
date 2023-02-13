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

  changeColorBackground(String? type) {
    switch (type ?? 'normal') {
      case 'grass':
        {
          return [
            ColorsPokemon.typeGrass,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fire':
        {
          return [ColorsPokemon.typeFire, ColorsPokemon.backgroundGalleryColor];
        }
      case 'water':
        {
          return [
            ColorsPokemon.typeWater,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'bug':
        {
          return [ColorsPokemon.typeBug, ColorsPokemon.backgroundGalleryColor];
        }
      case 'normal':
        {
          return [
            ColorsPokemon.typeNormal,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'poison':
        {
          return [
            ColorsPokemon.typePoison,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'electric':
        {
          return [
            ColorsPokemon.typeElectric,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'ground':
        {
          return [
            ColorsPokemon.typeGround,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fairy':
        {
          return [
            ColorsPokemon.typeFairy,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fighting':
        {
          return [
            ColorsPokemon.typeFighting,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'psychic':
        {
          return [
            ColorsPokemon.typePsychic,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'rock':
        {
          return [ColorsPokemon.typeRock, ColorsPokemon.backgroundGalleryColor];
        }
      case 'ghost':
        {
          return [
            ColorsPokemon.typeGhost,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'ice':
        {
          return [ColorsPokemon.typeIce, ColorsPokemon.backgroundGalleryColor];
        }
      case 'dragon':
        {
          return [
            ColorsPokemon.typeDragon,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'dark':
        {
          return [ColorsPokemon.typeDark, ColorsPokemon.backgroundGalleryColor];
        }
      case 'steel':
        {
          return [
            ColorsPokemon.typeSteel,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'flying':
        {
          return [
            ColorsPokemon.typeFlying,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      default:
        {
          return [
            ColorsPokemon.backgroundColor,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
    }
  }
}
