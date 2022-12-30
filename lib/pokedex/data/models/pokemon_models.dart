import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

class PokemonInformationModels extends PhotosInformation {
  const PokemonInformationModels({required List<Pokemon> photos})
      : super(photos: photos);
  factory PokemonInformationModels.fromJson(Map<String, dynamic> json) {
    final List<Pokemon> photos = [];
    json['results'].forEach((e) {
      photos.add(PokemonModels.fromJson(e));
    });
    return PokemonInformationModels(photos: photos);
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
      id: json['id'],
      name: json['name'],
      img: json['img'],
    );
  }
}
