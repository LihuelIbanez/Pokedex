import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
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
              child: BackGroundImage(url: controller.pokemonValue.img!),
            ),
          ],
        ));
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0, 1],
              end: Alignment.topLeft,
              colors: [
                ColorsPokemon.primaryColorDark,
                ColorsPokemon.primaryColorLight,
              ],
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
            ),
          ),
        ),
        Hero(
          tag: url,
          child: BounceInUp(
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
  }
}
