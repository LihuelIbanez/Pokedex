import 'package:equatable/equatable.dart';

class Stats extends Equatable {
  final int? id;
  final String? name;
  final String? height;
  final String? weight;

  const Stats({
    this.id,
    this.name,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        height,
      ];
}
