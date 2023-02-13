import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingPokeball extends StatelessWidget {
  const LoadingPokeball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Spin(
      infinite: true,
      child: ZoomIn(
          duration: const Duration(seconds: 2),
          child: SvgPicture.asset('assets/images/pokeball.svg', height: 150)),
    );
  }
}
