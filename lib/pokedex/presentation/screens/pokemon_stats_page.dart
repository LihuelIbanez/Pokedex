import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/bubble_stats_widget.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';

class PokemonStatsPage extends GetView<PokemonStatsController> {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsPokemon.backgroundGalleryColor,
        appBar: const AppBarPokemon(showback: true),
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
              return Stack(
                children: [
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          stops: const [0, 1],
                          end: Alignment.bottomLeft,
                          colors: ColorsPokemon.changeColorBackground(controller
                              .pokemonValue.type
                              .toString()
                              .toLowerCase()),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: ColorsPokemon.backgroundGalleryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  '${(pokemon.name).toString().toUpperCase()} #${controller.descriptionValue.id ?? ""}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  controller.description(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Obx(
                                () => ProgressStat(controller.showStatName,
                                    color: controller.color,
                                    number: controller.showStatValue,
                                    valueNotifier: controller.valueNotifier),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  StatButton(
                                      text: 'HP',
                                      onTap: () => controller.setupStats(
                                          'HP',
                                          controller.pokemonValue.hp!,
                                          Colors.green)),
                                  StatButton(
                                      text: 'ATK',
                                      onTap: () => controller.setupStats(
                                          'ATK',
                                          controller.pokemonValue.attack!,
                                          Colors.red)),
                                  StatButton(
                                      text: 'DEF',
                                      onTap: () => controller.setupStats(
                                          'DEF',
                                          controller.pokemonValue.defense!,
                                          Colors.blue)),
                                  StatButton(
                                      text: 'SPD',
                                      onTap: () => controller.setupStats(
                                          'SPD',
                                          controller.pokemonValue.speed!,
                                          Colors.yellow)),
                                  StatButton(
                                      text: 'SATK',
                                      onTap: () => controller.setupStats(
                                          'SATK',
                                          controller.pokemonValue.spAttack!,
                                          Colors.purple)),
                                  StatButton(
                                      text: 'SDEF',
                                      onTap: () => controller.setupStats(
                                          'SDEF',
                                          controller.pokemonValue.spDefense!,
                                          Colors.orange)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BounceInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        image: pokemon.img ?? 'assets/images/pokemon.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
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

class StatButton extends StatelessWidget {
  const StatButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ColorsPokemon.backgroundGalleryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
