import 'package:bookly/Features/home/data_source/home_local_data_sorce.dart';
import 'package:bookly/Features/home/data_source/home_remote_data+sorce.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

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
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      } else {
        return left(Serverfailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchnewestbooks() async {
    try {
      var CashedData = homeLocalDataSource.FetchNewestBooks();
      if (CashedData.isNotEmpty) {
        return right(CashedData);
      }
      var RemoteData = await homeRemoteDataSource.FetchNewestBooks();
      return right(RemoteData);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      } else {
        return left(Serverfailure(e.toString()));
      }
    }
  }
}
