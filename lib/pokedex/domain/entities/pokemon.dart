import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int? id;
  final String? name;
  final String? img;
  final String? type;
  final String? height;
  final String? weight;
  final String? category;
  final int? hp;
  final int? attack;
  final int? speed;
  final int? defense;
  final int? spAttack;
  final int? spDefense;
  final List<PokemonType>? pokemonType;

  const Pokemon({
    this.hp,
    this.attack,
    this.speed,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.type,
    this.height,
    this.weight,
    this.category,
    this.id,
    this.name,
    this.img,
    this.pokemonType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        img,
      ];
}

class PokemonType extends Equatable {
  final String? name;
  final String? url;
  const PokemonType({this.name, this.url});
  @override
  List<Object?> get props => [name, url];
}

class Description extends Equatable {
  final int? id;
  final String? description;
  final bool? isLegendary;
  final String? habitat;
  final String? generation;
  final int? baseHappiness;
  final int? captureRate;
  const Description(
      {this.id,
      this.baseHappiness,
      this.isLegendary,
      this.habitat,
      this.generation,
      this.captureRate,
      this.description});
  @override
  List<Object?> get props => [description];
}

enum PokemonTypes {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water
}
