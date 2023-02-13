import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';

class PokemonStatsPage extends GetView<PokemonStatsController> {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPokemon.backgroundGalleryColor,
      appBar: AppBarDiscover(showback: true),
      body: const _Content(),
    );
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
                url: controller.pokemonValue.img!,
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
    required this.url,
  });

  final Pokemon pokemon;
  final String url;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getPokemonStats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      stops: const [0, 1],
                      end: Alignment.bottomLeft,
                      colors: controller.changeColorBackground(controller
                          .pokemonValue.type
                          .toString()
                          .toLowerCase()),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 500,
                      color: ColorsPokemon.backgroundGalleryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(pokemon.name).toString().toUpperCase()} #${controller.descriptionValue.id ?? ""}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                itemCount:
                                    controller.pokemonValue.pokemonType == null
                                        ? 0
                                        : controller
                                            .pokemonValue.pokemonType!.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: BubbleStat(
                                      controller.pokemonValue
                                          .pokemonType![index].name!
                                          .toString(),
                                      color: controller.changeColorBackground(
                                          controller.pokemonValue
                                              .pokemonType![index].name!),
                                    ),
                                  );
                                }),
                          ),
                          Text(
                            controller.descriptionValue.description ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BubbleStat(
                                'HP: ${pokemon.hp ?? ""}',
                              ),
                              BubbleStat(
                                'SPEED: ${pokemon.speed ?? ""}',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BubbleStat(
                                'DEF: ${pokemon.defense ?? ""}',
                              ),
                              BubbleStat(
                                'ATTACK: ${pokemon.attack ?? ""}',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BubbleStat(
                                'SP DEFENSE: ${pokemon.spDefense ?? ""}',
                              ),
                              BubbleStat(
                                'SP ATTACK: ${pokemon.spAttack ?? ""}',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BubbleStat(
                                'Height: ${pokemon.height ?? ""} ft',
                              ),
                              BubbleStat(
                                'Weight: ${pokemon.weight ?? ""} lbs',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: url,
                  child: BounceInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        url,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class BubbleStat extends StatelessWidget {
  const BubbleStat(this.text, {super.key, this.color, this.fontsize});
  final String text;
  final List<Color>? color;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              stops: const [0.5, 1],
              end: Alignment.centerRight,
              colors: color ??
                  [
                    ColorsPokemon.backgroundGalleryColor,
                    ColorsPokemon.backgroundGalleryColor
                  ],
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontsize ?? 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
