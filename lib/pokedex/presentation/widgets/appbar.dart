import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';

class AppBarPokemon extends StatelessWidget with PreferredSizeWidget {
  AppBarPokemon({Key? key, this.showback = false}) : super(key: key);
  final bool showback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Image.asset('assets/images/pokemon.png', height: 30),
      centerTitle: true,
      backgroundColor: ColorsPokemon.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
