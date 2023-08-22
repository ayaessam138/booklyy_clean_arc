import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchfeaturedbooks();
  Future<Either<Failure, List<BookEntity>>> fetchnewestbooks();
}
