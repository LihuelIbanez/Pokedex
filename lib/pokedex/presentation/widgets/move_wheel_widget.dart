import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class MoveWheel extends StatelessWidget {
  const MoveWheel({super.key, required this.moves, required this.color});

  final List<PokemonMove> moves;
  final List<Color> color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3,
          color: color[0],
        ),
      ),
      child: ListWheelScrollView(
        itemExtent: 70,
        squeeze: 1.1,
        magnification: 3.5,
        diameterRatio: 2,
        children: [
          for (var i in moves)
            AbilityButton(
              text: i.name!,
              subtext: i.learnAt.toString(),
              index: moves.indexOf(i),
            )
        ],
      ),
    );
  }
}

class AbilityButton extends StatelessWidget {
  const AbilityButton(
      {super.key,
      required this.text,
      required this.subtext,
      required this.index});

  final String text;
  final String subtext;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (subtext == '0') {
      return const SizedBox();
    }
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ColorsPokemon.backgroundGalleryColor,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 3,
            color: ColorsPokemon.secondaryTextColor,
          ),
        ),
        child: Stack(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Flash(
                delay: Duration(milliseconds: 20 * index),
                infinite: true,
                animate: true,
                duration: const Duration(seconds: 1),
                child: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                  color: ColorsPokemon.deepblack,
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: Styles.pokemonFontTitleBlack,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      subtext,
                      style: Styles.pokemonFontTitleBlack,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
