import 'package:bookly/Features/home/data_source/home_local_data_sorce.dart';
import 'package:bookly/Features/home/data_source/home_remote_data+sorce.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeLocalDataSource, this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchfeaturedbooks() async {
    try {
      var CashedData = homeLocalDataSource.FetcFeaturedBooks();
      if (CashedData.isNotEmpty) {
        return right(CashedData);
      }
      var RemoteData = await homeRemoteDataSource.FetchFeaturedBooks();
      return right(RemoteData);
    } on Exception catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchnewestbooks() {
    // TODO: implement fetchnewestbooks
    throw UnimplementedError();
  }
}
