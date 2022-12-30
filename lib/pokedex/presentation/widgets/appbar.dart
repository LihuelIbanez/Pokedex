import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppBarDiscover extends StatelessWidget with PreferredSizeWidget {
  AppBarDiscover({Key? key, this.showback = false}) : super(key: key);
  final bool showback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: ZoomIn(
          child: Bounce(
        infinite: true,
        child: const Text('POKEDEX',
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Pixel',
                fontSize: 29,
                fontWeight: FontWeight.w800)),
      )),
      centerTitle: true,
      bottomOpacity: 0.0,
      backgroundColor: Colors.red[900],
      automaticallyImplyLeading: showback,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
