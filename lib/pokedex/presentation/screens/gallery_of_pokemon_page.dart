import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/gallery_of_pokemon_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/appbar.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/dropdown_double_list.dart';

class GalleryOFPokemonPage extends GetView<GalleryOfPokemonController> {
  const GalleryOFPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 155, 150),
      appBar: AppBarDiscover(),
      body: const _Content(),
    );
  }
}

// ignore: must_be_immutable
class _Content extends GetView<GalleryOfPokemonController> {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          //    ListView.builder(
          //       controller: controller.scrollController,
          //       itemCount: controller.pokemonListValue.length + 1,
          //       itemBuilder: (context, index) {
          //         if (index < controller.pokemonListValue.length) {
          //           final item = controller.pokemonListValue[index];
          //           return ListTile(
          //             title: Text(item.name!),
          //             subtitle: Text(item.name!),
          //           );
          //         } else {
          //           return const Padding(
          //               padding: EdgeInsets.symmetric(vertical: 32),
          //               child: Center(
          //                   child: CircularProgressIndicator(
          //                 color: Colors.white,
          //               )));
          //         }
          //       }),
          // )
          DropDownDoubleList(
        scrollController: controller.scrollController,
        imageList: controller.pokemonListValue,
        onTap: ((id, pokemon) => controller.goToPokemonStatsPage(id, pokemon)),
      ),
    );
  }
}
