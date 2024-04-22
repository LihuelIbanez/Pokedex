import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_list_usecase.dart';

class GalleryOfPokemonController extends GetxController
    with StateMixin<Pokemon> {
  late RxList<Pokemon> pokemonList = <Pokemon>[].obs;
  List<Pokemon> get pokemonListValue => pokemonList;

  late TextEditingController searchController;
  late TextEditingController firstPokemonController;
  late TextEditingController secondPokemonController;

  final RxBool _isComparationEnable = false.obs;
  bool get isComparationEnableValue => _isComparationEnable.value;
  final RxBool isOpen = false.obs;
  bool get isOpenValue => isOpen.value;

  final scrollController = ScrollController();

  final GetPokemonList pokemonListUseCase;

  GalleryOfPokemonController({
    required this.pokemonListUseCase,
  });

  int pageNumber = 0;
  @override
  void onInit() async {
    await controllerStarted();
    super.onInit();
  }

  @override
  void onClose() {
    TextEditingController().dispose();
    scrollController.dispose();
    searchController.dispose();
    firstPokemonController.dispose();
    secondPokemonController.dispose();
    super.onClose();
  }

  var allreadyCalled = false;

  Future<void> controllerStarted() async {
    if (pokemonList.isEmpty) {
      await loadPokemonList();
    }
    searchController = TextEditingController();
    firstPokemonController = TextEditingController();
    secondPokemonController = TextEditingController();
    scrollController.addListener((() {
      if (allreadyCalled) return;
      if (scrollController.position.pixels ==
          (scrollController.position.maxScrollExtent)) {
        pageNumber++;
        loadPokemonList();
        allreadyCalled = true;
        Future.delayed(const Duration(seconds: 5))
            .then((value) => allreadyCalled = false);
      }
    }));
    change(null, status: RxStatus.success());
  }

  Future loadPokemonList() async {
    try {
      final result =
          await pokemonListUseCase(GetPokemonListParams(20, pageNumber));
      result.fold((l) {
        change(null, status: RxStatus.error());
      }, (r) {
        pokemonList.addAll(r.pokemons!);
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void goToPokemonStatsPage(int id, Pokemon pokemon) {
    Get.toNamed(Routes.pokemonStats, arguments: [id, pokemon]);
  }

  void goToPokemonVersusPage() {
    int first = (firstPokemonController.value.text.isNotEmpty)
        ? int.parse(firstPokemonController.value.text)
        : 1;
    int second = (secondPokemonController.value.text.isNotEmpty)
        ? int.parse(secondPokemonController.value.text)
        : 1;
    Get.toNamed(Routes.pokemonVersus, arguments: [first, second]);
  }

  void searchPokemon() {
    if (searchController.text.isNotEmpty) {
      int id = int.parse(searchController.text);
      if (id > 0 && id < 898) {
        Get.toNamed(Routes.pokemonStats, arguments: [id]);
      }
    } else {
      loadPokemonList();
    }
  }

  void comparationCheckEnable() {
    _isComparationEnable.value = firstPokemonController.text.isNotEmpty &&
        secondPokemonController.text.isNotEmpty;
  }
}
