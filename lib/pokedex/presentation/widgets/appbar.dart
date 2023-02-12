import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';

class AppBarDiscover extends StatelessWidget with PreferredSizeWidget {
  AppBarDiscover({Key? key, this.showback = false}) : super(key: key);
  final bool showback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Image.asset('assets/images/pokemon.png', height: 30),
      centerTitle: true,
      bottomOpacity: 0.0,
      backgroundColor: ColorsPokemon.backgroundColor,
      automaticallyImplyLeading: showback,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
