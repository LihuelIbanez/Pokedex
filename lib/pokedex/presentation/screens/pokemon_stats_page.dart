import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';

class PokemonStatsPage extends GetView<PokemonStatsController> {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsPokemon.backgroundGalleryColor,
        appBar: AppBarDiscover(showback: true),
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
        future: controller.getPokemonDescription(),
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
                            SizedBox(
                              height: 80,
                              child: pokemon.pokemonType != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          ...pokemon.pokemonType!
                                              .map((e) => Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                    child: BubbleStat(
                                                      e.name!,
                                                      colorBorder: Colors.black,
                                                      border: 2,
                                                      color: controller
                                                          .changeColorBackground(
                                                              e.name!),
                                                    ),
                                                  ))
                                              .toList()
                                        ])
                                  : const SizedBox(),
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
                                  color: const [
                                    Colors.green,
                                    ColorsPokemon.backgroundGalleryColor
                                  ],
                                  fontColor: Colors.white,
                                ),
                                BubbleStat(
                                  'SPEED: ${pokemon.speed ?? ""}',
                                  color: const [
                                    Colors.blue,
                                    ColorsPokemon.backgroundGalleryColor
                                  ],
                                  fontColor: Colors.white,
                                  border: 4,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BubbleStat(
                                  'DEF: ${pokemon.defense ?? ""}',
                                  fontsize: 20,
                                  color: const [
                                    Colors.teal,
                                    ColorsPokemon.backgroundGalleryColor
                                  ],
                                  verticalPadding: 10,
                                ),
                                BubbleStat(
                                  'ATTACK: ${pokemon.attack ?? ""}',
                                  fontsize: 20,
                                  color: const [
                                    Colors.red,
                                    ColorsPokemon.backgroundGalleryColor
                                  ],
                                  verticalPadding: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BubbleStat(
                                  'SP DEFENSE: ${pokemon.spDefense ?? ""}',
                                  fontsize: 20,
                                  color: const [Colors.black, Colors.black12],
                                  fontColor: Colors.white,
                                  colorBorder: Colors.teal,
                                  border: 4,
                                  verticalPadding: 10,
                                ),
                                BubbleStat(
                                  'SP ATTACK: ${pokemon.spAttack ?? ""}',
                                  fontsize: 20,
                                  color: const [Colors.black, Colors.black12],
                                  colorBorder: Colors.red,
                                  border: 4,
                                  verticalPadding: 10,
                                ),
                              ],
                            ),
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
                    child: Image.network(
                      pokemon.img!,
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
  const BubbleStat(this.text,
      {super.key,
      this.color,
      this.fontsize,
      this.border,
      this.colorBorder,
      this.verticalPadding,
      this.fontColor});
  final String text;

  final List<Color>? color;
  final Color? fontColor;
  final Color? colorBorder;
  final double? fontsize;
  final double? border;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: verticalPadding ?? 10),
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: verticalPadding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border:
            Border.all(color: colorBorder ?? Colors.white, width: border ?? 0),
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
            color: fontColor ?? Colors.white,
            fontSize: fontsize ?? 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
