import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/constanst.dart';
import 'package:pokedex_flutter/core/utils/styles.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/presentation/controllers/pokemon_stats_controller.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/move_wheel_widget.dart';
import 'package:pokedex_flutter/pokedex/presentation/widgets/progress_stat_widget.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.pokemon,
    required this.controller,
  });

  final Pokemon pokemon;
  final PokemonStatsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 350),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: ColorsPokemon.backgroundGalleryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                    '${(pokemon.name!.toUpperCase())} #${controller.descriptionValue.id ?? ""}',
                    style: Styles.pokemonNameTitleBlack),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(controller.description(),
                    textAlign: TextAlign.center, style: Styles.description),
              ),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var type in controller.pokemonValue.pokemonType!)
                        TypesBanner(type: type),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.height_sharp,
                          size: 30,
                        ),
                        Text(' ${controller.pokemonValue.height} m',
                            style: Styles.pokemonFontTitleBlack),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.monitor_weight_outlined,
                          size: 30,
                        ),
                        Text('${controller.pokemonValue.weight} kg',
                            style: Styles.pokemonFontTitleBlack),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(
                () => ProgressStat(controller.showStatName,
                    color: controller.color,
                    number: controller.showStatValue,
                    valueNotifier: controller.valueNotifier),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatButton(
                        text: 'HP',
                        isSelected: controller.showStatName == 'HP',
                        onTap: () => controller.setupStats(
                            'HP', controller.pokemonValue.hp!, Colors.green)),
                    StatButton(
                        text: 'ATK',
                        isSelected: controller.showStatName == 'ATK',
                        onTap: () => controller.setupStats('ATK',
                            controller.pokemonValue.attack!, Colors.red)),
                    StatButton(
                        text: 'DEF',
                        isSelected: controller.showStatName == 'DEF',
                        onTap: () => controller.setupStats('DEF',
                            controller.pokemonValue.defense!, Colors.blue)),
                    StatButton(
                        text: 'SPD',
                        isSelected: controller.showStatName == 'SPD',
                        onTap: () => controller.setupStats('SPD',
                            controller.pokemonValue.speed!, Colors.yellow)),
                    StatButton(
                        text: 'SATK',
                        isSelected: controller.showStatName == 'SATK',
                        onTap: () => controller.setupStats('SATK',
                            controller.pokemonValue.spAttack!, Colors.purple)),
                    StatButton(
                        text: 'SDEF',
                        isSelected: controller.showStatName == 'SDEF',
                        onTap: () => controller.setupStats('SDEF',
                            controller.pokemonValue.spDefense!, Colors.orange)),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Abilities', style: Styles.subTitle)),
              Obx(
                () => MoveWheel(
                  color: ColorsPokemon.changeColorBackground(
                      controller.pokemonValue.type.toString().toLowerCase()),
                  moves: controller.pokemonValue.moves!,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypesBanner extends StatelessWidget {
  const TypesBanner({super.key, required this.type});

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Flash(
      infinite: true,
      duration: const Duration(seconds: 3),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: ColorsPokemon.deepblack,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            stops: const [0.8, 1],
            end: Alignment.bottomRight,
            colors: ColorsPokemon.changeColorBackground(type.name),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              type.name!.toUpperCase(),
              style: Styles.pokemonFontTitleWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class StatButton extends StatelessWidget {
  const StatButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: ColorsPokemon.backgroundGalleryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: isSelected
                ? ColorsPokemon.deepblack
                : ColorsPokemon.backgroundGalleryColor,
          ),
        ),
        child: Text(text, style: Styles.statOption),
      ),
    );
  }
}
