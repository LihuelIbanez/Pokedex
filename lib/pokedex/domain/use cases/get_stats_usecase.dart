import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';
import 'package:pokedex_flutter/core/use%20cases/use_case.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';

class GetPokemonStats extends UseCase<Pokemon, GetPokemonParams> {
  final PokemonRepository repository;

  GetPokemonStats(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(GetPokemonParams params) async {
    return await repository.getPokemonStats(params.id);
  }
}

class GetPokemonParams extends Equatable {
  final int id;

  const GetPokemonParams(this.id);

  @override
  List<Object?> get props => [id];
}
