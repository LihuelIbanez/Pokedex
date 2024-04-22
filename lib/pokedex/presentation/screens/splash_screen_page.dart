import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = const Duration(seconds: 3); //SetUp duration here
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Get.offAllNamed(Routes.pokemonGallery);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              ColorsPokemon.backgroundColor,
              ColorsPokemon.backgroundColor
            ])),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text('POKEDEX app',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Pixel',
                            fontSize: 10,
                            fontWeight: FontWeight.w800)))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: animation.value * 500,
                    child: Center(
                      child: Spin(
                        duration: const Duration(seconds: 2),
                        child: ZoomIn(
                            duration: const Duration(seconds: 2),
                            child: SvgPicture.asset(
                                'assets/images/pokeball.svg',
                                height: 150)),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
