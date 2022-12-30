import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/dropdown_double_list.dart';

class GalleryOFPokemonPage extends GetView<GalleryOfPokemonController> {
  const GalleryOFPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      appBar: AppBarDiscover(),
      body: const _Content(),
    );
  }
}

class _Content extends GetView<GalleryOfPokemonController> {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropDownDoubleList(
        imageList: controller.pokemonListValue,
        onTap: ((id, pokemon) => controller.goToPokemonStatsPage(id, pokemon)),
      ),
    );
  }
}
