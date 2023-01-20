import 'package:hive_flutter/hive_flutter.dart';

import '../../data/vos/book_vo.dart';

abstract class BookDatabaseDao {
  Future<Box> openBox();
  List<BookVO> getBookFromWishListDatabase(Box box);
  Future<void> addBookToWishList(Box box, BookVO bookVO);
  Future<void> removeBookFromWishList(Box box, BookVO bookVO);
  Future<void> clearWishList(Box box);
}
