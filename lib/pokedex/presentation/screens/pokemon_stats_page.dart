import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/pokemon_image_widget.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/stat_card_widget.dart';

class PokemonStatsPage extends GetView<PokemonStatsController> {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsPokemon.backgroundGalleryColor,
        appBar: const AppBarPokemon(
            title: Text(
              'STATS',
              style: Styles.appbarStyle,
            ),
            showback: true),
        body: controller.obx(
          (state) => const _Content(),
          onLoading: const Center(child: LoadingPokeball()),
          onError: (error) => Center(child: Text(error.toString())),
        ));
  }
}

class _Content extends GetView<PokemonStatsController> {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: BackGroundImage(
                pokemon: controller.pokemonValue,
              ),
            ),
          ],
        ));
  }
}

class BackGroundImage extends GetView<PokemonStatsController> {
  const BackGroundImage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
          future: controller.getPokemonDescription(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        height: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            stops: const [0, 1],
                            end: Alignment.bottomLeft,
                            colors: ColorsPokemon.changeColorBackground(
                                controller.pokemonValue.type
                                    .toString()
                                    .toLowerCase()),
                          ),
                        ),
                      ),
                    ),
                    StatCard(pokemon: pokemon, controller: controller),
                    PokemonImage(pokemon: pokemon),
                  ],
                ),
              );
            } else {
              return const Center(
                child: LoadingPokeball(),
              );
            }
          }),
    );
  }
}
