import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: BounceInDown(
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
    );
  }
}
