import 'package:either_dart/either.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonList>> getPokemons(
      int numLimit, int pageNumber);

  Future<Either<Failure, Pokemon>> getPokemonStats(int id);

  Future<Either<Failure, Description>> getPokemonDescription(int id);
}
