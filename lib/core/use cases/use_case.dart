import 'package:either_dart/either.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
