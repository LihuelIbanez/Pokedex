import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';

class AppBarPokemon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPokemon({Key? key, this.showback = false, this.title})
      : super(key: key);
  final Widget? title;

  final bool showback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: title ?? Image.asset('assets/images/pokemon.png', height: 30),
      centerTitle: true,
      leading: showback
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      backgroundColor: ColorsPokemon.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
