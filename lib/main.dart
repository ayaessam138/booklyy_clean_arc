import 'package:bookly/Features/home/data/repos/homerepo_impl.dart';
import 'package:bookly/Features/home/data_source/home_local_data_sorce.dart';
import 'package:bookly/Features/home/data_source/home_remote_data+sorce.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featuredaBooks_usecase.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_newestBooks_usecase.dart';
import 'package:bookly/Features/home/presentation/manger/Fetch_newest_books_cubit/cubit/fetchnewestbooks_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/apiservice.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/Splash/presentation/views/splash_view.dart';
import 'package:hive/hive.dart';

import 'core/utils/Functions/setupserviceLocator.dart';

void main() async {
  runApp(const Bookly());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kfeaturedBox);
  HomeLocalDataSource homeRemoteDataSource;
  ApiService apiService;
  setUpServiceLocator();
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FetchFeaturedBooksCubit(FetchFeaturedBooksUseCase(
            getit.get<HomeRepoImpl>(),
          ));
        }),
        BlocProvider(create: (context) {
          return FetchnewestbooksCubit(
              FetchNewestBooksUseCase(getit.get<HomeRepoImpl>()));
        })
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
