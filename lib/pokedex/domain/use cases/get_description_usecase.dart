import 'package:either_dart/either.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';
import 'package:pokedex_flutter/core/use%20cases/use_case.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/pokedex/domain/use%20cases/get_stats_usecase.dart';

class GetPokemonDescription extends UseCase<Description, GetPokemonParams> {
  final PokemonRepository repository;

  GetPokemonDescription(this.repository);

  @override
  Future<Either<Failure, Description>> call(GetPokemonParams params) async {
    return await repository.getPokemonDescription(params.id);
  }
}
