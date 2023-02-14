import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
          const PokemonVersusCall()
        ],
      ),
    );
  }
}

class PokemonVersusCall extends GetView<GalleryOfPokemonController> {
  const PokemonVersusCall({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => controller.isOpen.value = !controller.isOpenValue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pokemon', style: Styles.textStyleTitle),
                  SvgPicture.asset(
                    'assets/images/vs.svg',
                    height: 30,
                  ),
                  const Text('Pokemon', style: Styles.textStyleTitle),
                ],
              ),
            ),
            Visibility(
              visible: controller.isOpenValue,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: ColorsPokemon.backgroundGalleryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        controller: controller.firstPokemonController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        onChanged: (text) =>
                            controller.comparationCheckEnable(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        decoration: Styles.inputDecorationVersus(
                          '#001',
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isComparationEnableValue,
                    child: GestureDetector(
                      onTap: () => controller.goToPokemonVersusPage(),
                      child: SvgPicture.asset(
                        'assets/images/vs.svg',
                        height: 60,
                        color: controller.isComparationEnableValue
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: ColorsPokemon.backgroundGalleryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        controller: controller.secondPokemonController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        onChanged: (text) =>
                            controller.comparationCheckEnable(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        decoration: Styles.inputDecorationVersus(
                          '#002',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            controller.isOpenValue
                ? const Icon(Icons.arrow_drop_up)
                : const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
