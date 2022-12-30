import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';

class PokemonStatsPage extends GetView<PokemonStatsController> {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
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
              child: BackGroundImage(url1: controller.pokemonValue.img!),
            ),
          ],
        ));
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
    required this.url1,
  });
  final String url1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BounceInUp(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                url1,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
