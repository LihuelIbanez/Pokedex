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

  const Pokemon({
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
