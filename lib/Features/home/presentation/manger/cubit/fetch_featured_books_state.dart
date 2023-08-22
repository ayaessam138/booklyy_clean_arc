part of 'fetch_featured_books_cubit.dart';

@immutable
class FetchFeaturedBooksState {}

class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

class FetchFeaturedBooksSucess extends FetchFeaturedBooksState {
  List<BookEntity> BookList;
  FetchFeaturedBooksSucess(this.BookList);
}

class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  String message;
  FetchFeaturedBooksFailure(this.message);
}
