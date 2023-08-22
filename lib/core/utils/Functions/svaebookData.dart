import 'package:bookly/Features/home/domain/entities/bookEntity.dart';
import 'package:hive/hive.dart';

void SaveBoksData(List<BookEntity> Booklist, boxname) {
  var box = Hive.box(boxname);
  box.addAll(Booklist);
}
