import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/usecases/nopramusecase.dart';
import 'package:bookly/Features/home/domain/usecases/usecase.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCasenoPram<List<BookEntity>> {
  final HomeRepo homerepo;

  FetchNewestBooksUseCase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> Call([param]) {
    return homerepo.fetchnewestbooks();
  }
}
