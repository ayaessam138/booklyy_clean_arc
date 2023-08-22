import 'package:bookly/Features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:bookly/core/utils/apiservice.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> FetchFeaturedBooks();
  Future<List<BookEntity>> FetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> FetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookEntity> Bookslist = getbookinList(data);
    return Bookslist;
  }

  List<BookEntity> getbookinList(Map<String, dynamic> data) {
    List<BookEntity> Bookslist = [];
    for (var item in data['items']) {
      Bookslist.add(Bookmodel.fromJson(item));
    }
    return Bookslist;
  }

  @override
  Future<List<BookEntity>> FetchNewestBooks() async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
    List<BookEntity> Bookslist = getbookinList(data);
    return Bookslist;
  }
}
