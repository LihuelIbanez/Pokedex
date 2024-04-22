import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';

class PhotoThumb extends StatelessWidget {
  const PhotoThumb({
    Key? key,
    required this.id,
    required this.name,
    required this.photoLow,
    this.index = 8,
  }) : super(key: key);
  final int id;
  final String name;
  final String photoLow;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImagePalette(NetworkImage(photoLow)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(children: [
            Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FutureBuilder(
                      future: _getImagePalette(NetworkImage(photoLow)),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? Container(
                                  height: 200,
                                  width: 200,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        stops: [0, 1],
                                        end: Alignment.bottomRight,
                                        colors: [Colors.white, Colors.white]),
                                  ))
                              : Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        stops: const [0, 1],
                                        end: Alignment.bottomRight,
                                        colors: [
                                          snapshot.data!,
                                          snapshot.data!.withOpacity(0.5)
                                        ]),
                                  ),
                                ),
                    ))
              ],
            ),
            FadeInLeft(
              duration: Duration(milliseconds: 300 * index),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, right: 10),
                  child: Opacity(
                    opacity: 0.2,
                    child: Pulse(
                      animate: false,
                      infinite: true,
                      duration: const Duration(milliseconds: 2000),
                      child: SvgPicture.asset('assets/images/pokeball.svg',
                          colorBlendMode: BlendMode.screen, height: 100),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FadeInImage.assetNetwork(
                  placeholderFit: BoxFit.none,
                  placeholderScale: 5,
                  placeholder: 'assets/images/loading.gif',
                  image: photoLow,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20),
                  child: Text(name,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.pokemonCardTitleBlack),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('#${returnfullLengt(id.toString())}',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.pokemonFontTitleBlack),
                ),
              ],
            )
          ]);
        }
      },
    );
  }
}

String returnfullLengt(String number) {
  if (number.length == 1) {
    return '00$number';
  } else if (number.length == 2) {
    return '0$number';
  } else {
    return number;
  }
}

Future<Color> _getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor!.color;
}
