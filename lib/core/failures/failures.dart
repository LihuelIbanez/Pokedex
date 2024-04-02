import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  showError(BuildContext? context, {VoidCallback? callback});

  static Failure getFailureFromString(String className) {
    if (className == (ServerFailure).toString()) {
      return ServerFailure('');
    }
    if (className == (NetworkFailure).toString()) {
      return NetworkFailure();
    }
    if (className == (BadRequestFailure).toString()) {
      return BadRequestFailure();
    }
    return BadRequestFailure();
  }
}

class ServerFailure extends Failure {
  final Object error;

  ServerFailure(this.error);
  @override
  List<Object> get props => [];
  @override
  showError(BuildContext? context, {VoidCallback? callback}) {}
}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  showError(BuildContext? context, {VoidCallback? callback}) {}
}

class BadRequestFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  showError(BuildContext? context, {VoidCallback? callback}) {}
}
