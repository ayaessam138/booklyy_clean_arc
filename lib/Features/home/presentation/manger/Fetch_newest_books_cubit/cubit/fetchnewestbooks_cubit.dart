import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_newestBooks_usecase.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:meta/meta.dart';

part 'fetchnewestbooks_state.dart';

class FetchnewestbooksCubit extends Cubit<FetchnewestbooksState> {
  FetchnewestbooksCubit(this.fetchNewestBooksUseCase)
      : super(FetchnewestbooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> Fetchnewestbooks() async {
    var Result = await fetchNewestBooksUseCase.Call();
    Result.fold((Failure) {
      emit(FetchnewestbooksFailure(Failure.errormessage));
    }, (books) {
      emit(FetchnewestbooksSucess(books));
    });
  }
}
