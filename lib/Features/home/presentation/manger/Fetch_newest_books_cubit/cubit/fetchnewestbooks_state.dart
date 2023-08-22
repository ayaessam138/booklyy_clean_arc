part of 'fetchnewestbooks_cubit.dart';

@immutable
class FetchnewestbooksState {}

class FetchnewestbooksInitial extends FetchnewestbooksState {}

class FetchnewestbooksLoading extends FetchnewestbooksState {}

class FetchnewestbooksFailure extends FetchnewestbooksState {
  String Errormessage;
  FetchnewestbooksFailure(this.Errormessage);
}

class FetchnewestbooksSucess extends FetchnewestbooksState {
  List<BookEntity> Booklist;
  FetchnewestbooksSucess(this.Booklist);
}
