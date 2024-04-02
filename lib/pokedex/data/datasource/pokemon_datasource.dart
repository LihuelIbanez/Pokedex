import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/pokedex/data/models/pokemon_models.dart';

abstract class PokemonDataSource {
  Future<PokemonListModel> getPokemons(int numLimit, int pageNumber);

  Future<StatsModel> getPokemonStats(int id);

  Future<DescriptionModel> getPokemonDescription(int id);
}

class PokemonDataSourceImpl implements PokemonDataSource {
  final HttpClient client;

  PokemonDataSourceImpl(this.client);

  @override
  Future<PokemonListModel> getPokemons(int numLimit, int pageNumber) async {
    final response = await client.get(
      "/pokemon?limit=$numLimit&offset=${numLimit * pageNumber}",
    );
    return PokemonListModel.fromJson(response.data);
  }

  @override
  Future<StatsModel> getPokemonStats(int id) async {
    final response = await client.get("/pokemon/$id");
    return StatsModel.fromJson(response.data);
  }

  @override
  Future<DescriptionModel> getPokemonDescription(int id) async {
    final response = await client.get("/pokemon-species/$id");
    return DescriptionModel.fromJson(response.data);
  }
}
