import 'package:bookly/Features/home/data/repos/homerepo_impl.dart';
import 'package:bookly/Features/home/data_source/home_local_data_sorce.dart';
import 'package:bookly/Features/home/data_source/home_remote_data+sorce.dart';
import 'package:bookly/core/utils/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setUpServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceimpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getit.get<ApiService>()),
    ),
  );
}
