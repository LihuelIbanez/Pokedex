import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.toNamed(Routes.pokemonGallery);
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
              Colors.red,
              Colors.redAccent,
              Colors.redAccent,
              Colors.red
            ])),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
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
                      child: ZoomOut(
                        delay: const Duration(seconds: 1),
                        child: Text('POKEDEX',
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pixel',
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                            textScaleFactor: animation.value * 4),
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
