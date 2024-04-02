import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_versus_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/loading_pokeball.dart';

class PokemonVersusPage extends GetView<PokemonVersusController> {
  const PokemonVersusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarPokemon(
          title: SvgPicture.asset('assets/images/vs.svg', height: 30),
        ),
        body: controller.obx(
          (state) => const _Content(),
          onLoading: const Center(child: LoadingPokeball()),
          onError: (error) => Center(child: Text(error.toString())),
        ));
  }
}

class _Content extends GetView<PokemonVersusController> {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Row(
            children: [
              PokemonRow(pokemon: controller.pokemonListValue[0]),
              PokemonRow(pokemon: controller.pokemonListValue[1]),
            ],
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: SvgPicture.asset('assets/images/vs.svg'),
              )),
        ],
      ),
    );
  }
}

class PokemonRow extends GetView<PokemonVersusController> {
  const PokemonRow({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: Get.width / 2,
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ColorsPokemon.changeColorBackground(
                    pokemon.pokemonType![0].name),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: Get.width / 2,
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/pokeball.png',
              image: pokemon.img ??
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
              height: 200,
            ),
          ],
        ),
      ],
    );
  }
}
