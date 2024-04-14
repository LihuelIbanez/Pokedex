import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';

class ProgressStat extends StatelessWidget {
  const ProgressStat(this.text,
      {super.key,
      required this.color,
      required this.number,
      this.fontColor,
      required this.valueNotifier});
  final String text;
  final int? number;
  final Color color;
  final Color? fontColor;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.aspectRatio(
      aspectRatio: 2,
      valueNotifier: valueNotifier,
      animationCurve: Curves.bounceIn,
      maxProgress: 200,
      progress: number!.toDouble(),
      startAngle: 244,
      sweepAngle: 235,
      foregroundColor: color,
      backgroundColor: const Color(0xffeeeeee),
      foregroundStrokeWidth: 15,
      backgroundStrokeWidth: 15,
      animation: true,
      seekColor: const Color(0xffeeeeee),
      child: Center(
        child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (_, double value, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${value.toInt()}', style: Styles.statNumber),
                    Text(text, style: Styles.statName),
                  ],
                )),
      ),
    );
  }
}
