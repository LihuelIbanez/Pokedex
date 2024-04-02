import 'package:either_dart/either.dart';
import 'package:pokedex_flutter/core/failures/exeptions.dart';
import 'package:pokedex_flutter/core/failures/failures.dart';

class ApiNetwork {
  static Future<Either<Failure, T>> call<T>(Function() function) async {
    try {
      T result = await function();
      return Right(result);
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
