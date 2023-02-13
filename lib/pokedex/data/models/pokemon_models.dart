import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonModels extends Pokemon {
  const PokemonModels({
    int? id,
    String? name,
    String? img,
  }) : super(
          id: id,
          name: name,
          img: img,
        );
  factory PokemonModels.fromJson(Map<String, dynamic> json) {
    return PokemonModels(
      id: int.parse((json['url']).substring(34).replaceAll('/', '')),
      name: json['name'],
      img:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${int.parse((json['url']).substring(34).replaceAll('/', ''))}.png',
    );
  }
}

class StatsModel extends Pokemon {
  const StatsModel({
    int? id,
    String? name,
    String? img,
    String? type,
    String? height,
    String? weight,
    String? category,
    int? hp,
    int? attack,
    int? speed,
    int? defense,
    int? spAttack,
    int? spDefense,
    List<PokemonType>? pokemonType,
  }) : super(
          id: id,
          name: name,
          img: img,
          type: type,
          height: height,
          weight: weight,
          attack: attack,
          hp: hp,
          speed: speed,
          defense: defense,
          spAttack: spAttack,
          spDefense: spDefense,
          category: category,
          pokemonType: pokemonType,
        );
  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      id: json['id'],
      name: json['name'],
      img:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png',
      type: json['types'][0]['type']['name'],
      height: json['height'].toString(),
      weight: json['weight'].toString(),
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      spAttack: json['stats'][3]['base_stat'],
      spDefense: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
      category: json['species']['url'],
      pokemonType: json['types']
          .map<PokemonType>((e) => PokemonType(
                name: e['type']['name'],
                url: e['type']['url'],
              ))
          .toList(),
    );
  }
}

class DescriptionModel extends Description {
  const DescriptionModel({
    int? id,
    String? description,
    bool? isLegendary,
    String? habitat,
    String? generation,
    int? baseHappiness,
    int? captureRate,
  }) : super(
          id: id,
          isLegendary: isLegendary,
          description: description,
          baseHappiness: baseHappiness,
        );
  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      id: json['id'],
      description: (json['flavor_text_entries'][26]['flavor_text'])
          .replaceAll('\n', ' '),
      isLegendary: json['is_legendary'],
      baseHappiness: json['base_happiness'],
      captureRate: json['capture_rate'],
      generation: (json['generation']['name']).toString().toUpperCase(),
      habitat: json['habitat']['name'],
    );
  }
}
