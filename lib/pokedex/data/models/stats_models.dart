import 'package:pokedex_flutter/pokedex/domain/entities/stats.dart';

class StatsModels extends Stats {
  const StatsModels({
    int? id,
    String? name,
    String? height,
    String? weight,
  }) : super(
          id: id,
          name: name,
          height: height,
          weight: weight,
        );
  factory StatsModels.fromJson(Map<String, dynamic> json) {
    return StatsModels(
      id: json['001'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
