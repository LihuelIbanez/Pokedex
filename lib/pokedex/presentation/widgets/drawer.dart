import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';

class PokemonDrawer extends StatelessWidget {
  const PokemonDrawer({super.key, required this.controller});
  final GalleryOfPokemonController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsPokemon.backgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorsPokemon.backgroundColor,
            ),
            child: Image.asset('assets/images/pokemon.png', height: 30),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: ColorsPokemon.backgroundGalleryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
              controller: controller.searchController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4)
              ],
              style: const TextStyle(color: Colors.black, fontSize: 20),
              decoration: Styles.inputDecorationSearchBar(
                'Busqueda #',
                onTap: () => controller.searchPokemon(),
              ),
            ),
          ),
          Center(
            child: ListTile(
              title: const Text('Pokemon vs Pokemon'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
