import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';

class PhotoThumb extends StatelessWidget {
  const PhotoThumb({
    Key? key,
    required this.id,
    required this.name,
    required this.photoLow,
    this.isEven = false,
  }) : super(key: key);
  final int id;
  final String name;
  final String photoLow;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 125,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    stops: const [0, 1],
                    end: Alignment.topLeft,
                    colors: [
                      ColorsPokemon.primaryColorDark.withOpacity(0.2),
                      ColorsPokemon.primaryColorLight.withOpacity(1.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Hero(
        tag: id,
        transitionOnUserGestures: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              height: 125,
              child: FadeInImage.assetNetwork(
                placeholderFit: BoxFit.none,
                placeholderScale: 5,
                placeholder: 'assets/images/loading.gif',
                image: photoLow,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
      Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.center,
              child: Text('id: $id \n$name ',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.pokemonFontTitleWhite)),
        ],
      ),
    ]);
  }
}
