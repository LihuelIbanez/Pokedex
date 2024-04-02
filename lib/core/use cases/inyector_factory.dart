import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_flutter/pokedex/data/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';

class InjectorFactory {
  static PokemonRepository createCancelationsRepository() {
    try {
      return Get.find<PokemonRepository>();
    } catch (_) {
      final dataSource = PokemonDataSourceImpl(Get.find<HttpClient>());
      final repository = PokemonRepositoryImpl(dataSource);
      Get.lazyPut<PokemonRepository>(() => repository);
      return repository;
    }
  }
}
