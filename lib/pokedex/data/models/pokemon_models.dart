import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonListModel extends PokemonList {
  const PokemonListModel({
    List<Pokemon>? pokemons,
  }) : super(
          pokemons: pokemons,
        );
  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      pokemons: (json['results'] as List)
          .map<Pokemon>((e) => PokemonModels.fromJson(e))
          .toList(),
    );
  }
}

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
    List<PokemonMove>? moves,
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
          moves: moves,
          pokemonType: pokemonType,
        );
  factory StatsModel.fromJson(Map<String, dynamic> json) {
    var movesList = List<PokemonMoveModel>.from(json['moves']
        .map<PokemonMoveModel>((moves) => PokemonMoveModel.fromJson(moves)));
    movesList.sort((a, b) => a.learnAt!.compareTo(b.learnAt!));
    movesList.removeWhere((element) => element.learnAt == 0);
    return StatsModel(
        id: json['id'],
        name: json['name'],
        img:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png',
        type: json['types'][0]['type']['name'],
        height: (json['height'] / 10).toString(),
        weight: (json['weight'] / 10).toString(),
        hp: json['stats'][0]['base_stat'],
        attack: json['stats'][1]['base_stat'],
        defense: json['stats'][2]['base_stat'],
        spAttack: json['stats'][3]['base_stat'],
        spDefense: json['stats'][4]['base_stat'],
        speed: json['stats'][5]['base_stat'],
        category: json['species']['name'],
        moves: movesList,
        pokemonType: List<PokemonTypeModel>.from(json['types']
            .map<PokemonTypeModel>((type) => PokemonMoveModel.fromJson(type))));
  }
}

class PokemonTypeModel extends PokemonType {
  const PokemonTypeModel({
    String? name,
    String? url,
  }) : super(
          name: name,
          url: url,
        );
  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      name: json['type']['name'],
      url: json['type']['url'],
    );
  }
}

class PokemonMoveModel extends PokemonMove {
  const PokemonMoveModel({
    String? name,
    String? url,
    int? learnAt,
  }) : super(
          name: name,
          url: url,
          learnAt: learnAt,
        );

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    return PokemonMoveModel(
      name: json['move']['name'],
      url: json['move']['url'],
      learnAt: json['version_group_details'][0]['level_learned_at'],
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
