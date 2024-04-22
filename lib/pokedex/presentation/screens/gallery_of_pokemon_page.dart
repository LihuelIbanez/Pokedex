import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/drawer.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/dropdown_list.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';

class GalleryOfPokemonPage extends GetView<GalleryOfPokemonController> {
  const GalleryOfPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsPokemon.backgroundGalleryColor,
        drawer: PokemonDrawer(
          controller: controller,
        ),
        appBar: const AppBarPokemon(
          title: Text(
            'GALLERY',
            style: Styles.appbarStyle,
          ),
        ),
        body: controller.obx(
          (state) => const _Content(),
          onLoading: const Center(child: LoadingPokeball()),
          onError: (error) => Center(child: Text(error.toString())),
        ));
  }
}

class _Content extends GetView<GalleryOfPokemonController> {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownDoubleList(
      controller: controller,
      scrollController: controller.scrollController,
      onTap: ((id, pokemon) => controller.goToPokemonStatsPage(id, pokemon)),
    );
  }
}
