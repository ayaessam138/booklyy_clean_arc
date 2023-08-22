import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCasenoPram<Type> {
  Future<Either<Failure, Type>> Call();
}
