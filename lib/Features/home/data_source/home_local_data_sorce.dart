import 'package:bookly/Features/home/domain/entities/bookEntity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> FetcFeaturedBooks();
  List<BookEntity> FetchNewestBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> FetcFeaturedBooks() {
    // TODO: implement FetcFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> FetchNewestBooks() {
    // TODO: implement FetchNewestBooks
    throw UnimplementedError();
  }
}
