import 'package:equatable/equatable.dart';

class PhotosInformation extends Equatable {
  final List<Pokemon> photos;
  const PhotosInformation({required this.photos});
  @override
  List<Object?> get props => [photos];
}

class Pokemon extends Equatable {
  final int? id;
  final String? name;
  final String? img;
  final String? type;
  final String? height;
  final String? weight;
  final String? description;
  final String? category;
  final String? abilities;
  final Future<Pokemon>? futurePokemon;

  const Pokemon({
    this.futurePokemon,
    this.type,
    this.height,
    this.weight,
    this.description,
    this.category,
    this.abilities,
    this.id,
    this.name,
    this.img,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        img,
      ];
}
