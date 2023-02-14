import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';

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
