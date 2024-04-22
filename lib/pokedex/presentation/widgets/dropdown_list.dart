import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';

import 'photo_thumb.dart';

typedef CheckCallback = void Function(int id, Pokemon pokemon);

class DropDownDoubleList extends StatelessWidget {
  const DropDownDoubleList({
    Key? key,
    required this.onTap,
    required this.scrollController,
    required this.controller,
  }) : super(key: key);

  final GalleryOfPokemonController controller;
  final ScrollController scrollController;
  final CheckCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          Obx(
            () => GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              clipBehavior: Clip.hardEdge,
              itemCount: controller.pokemonList.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    onTap(controller.pokemonList[index].id!,
                        controller.pokemonList[index]);
                  },
                  child: PhotoThumb(
                    index: index < 9 ? index : 0,
                    name: controller.pokemonList[index].name ?? '',
                    photoLow: controller.pokemonList[index].img!,
                    id: controller.pokemonList[index].id ?? 0,
                  ),
                );
              },
            ),
          ),
          const Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 100, top: 20),
                  child: SizedBox(height: 50, child: LoadingPokeball())))
        ],
      ),
    );
  }
}
