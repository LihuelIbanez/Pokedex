import 'package:either_dart/either.dart';
import 'package:pokedex_flutter/core/failures/api_network.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';
import 'package:pokedex_flutter/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PokemonList>> getPokemons(
      int numLimit, int pageNumber) {
    return ApiNetwork.call<PokemonList>(
        () async => dataSource.getPokemons(numLimit, pageNumber));
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonStats(int id) {
    return ApiNetwork.call(() => dataSource.getPokemonStats(id));
  }

  @override
  Future<Either<Failure, Description>> getPokemonDescription(int id) {
    return ApiNetwork.call(() => dataSource.getPokemonDescription(id));
  }
}
