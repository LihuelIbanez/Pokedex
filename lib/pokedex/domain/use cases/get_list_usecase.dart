import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';
import 'package:pokedex_flutter/core/use%20cases/use_case.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';

class GetPokemonList extends UseCase<PokemonList, GetPokemonListParams> {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  @override
  Future<Either<Failure, PokemonList>> call(GetPokemonListParams params) async {
    return await repository.getPokemons(params.limit, params.page);
  }
}

class GetPokemonListParams extends Equatable {
  final int limit;
  final int page;

  const GetPokemonListParams(this.limit, this.page);

  @override
  List<Object?> get props => [limit, page];
}
