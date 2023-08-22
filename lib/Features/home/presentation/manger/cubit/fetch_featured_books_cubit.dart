import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featuredaBooks_usecase.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:meta/meta.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.featuredBooksUseCase)
      : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> FetchFeaturedBooks() async {
    emit(FetchFeaturedBooksLoading());
    var result = await featuredBooksUseCase.Call();
    result.fold((Failure) {
      emit(FetchFeaturedBooksFailure(Failure.errormessage));
    }, (books) {
      emit(FetchFeaturedBooksSucess(books));
    });
  }
}
