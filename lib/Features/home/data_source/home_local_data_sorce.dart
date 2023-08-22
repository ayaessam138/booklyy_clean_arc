import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> FetcFeaturedBooks();
  List<BookEntity> FetchNewestBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> FetcFeaturedBooks() {
    var box = Hive.box<BookEntity>(kfeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> FetchNewestBooks() {
    var box = Hive.box<BookEntity>(knewestBox);
    return box.values.toList();
  }
}
