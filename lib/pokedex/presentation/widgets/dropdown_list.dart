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
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.pokemonList.length + 1,
                  itemBuilder: (_, index) {
                    if (index < controller.pokemonList.length) {
                      return GestureDetector(
                        onTap: () {
                          onTap(controller.pokemonList[index].id!,
                              controller.pokemonList[index]);
                        },
                        child: PhotoThumb(
                          name: controller.pokemonList[index].name ?? '',
                          photoLow: controller.pokemonList[index].img!,
                          id: controller.pokemonList[index].id ?? 0,
                        ),
                      );
                    } else {
                      return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                              child: SizedBox(
                                  height: 50, child: LoadingPokeball())));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
