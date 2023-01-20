import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/data/vos/book_vo.dart';
import '../../hive_constants.dart';
import '../book_dao.dart';

class BookDaoImpl extends BookDao{
  static final BookDaoImpl _singleton = BookDaoImpl._internal();

  factory BookDaoImpl(){
    return _singleton;
  }

  BookDaoImpl._internal();

  void savedAllBooks(List<BookVO?> books)async{
    Map<String, BookVO> bookMap = Map.fromIterable(books,
        key: (books) => books?.title, value: (books) => books);
    await getBookBox().putAll(bookMap);
  }

  void savedSingleBook(BookVO? book)async{
    return getBookBox().put(book?.title, book!);
  }

  List<BookVO>? getAllBooks(){
    List<BookVO> bookList = getBookBox().values.toList();
    bookList.forEach((book) {
      debugPrint("Book title====>${book.title}");
    });
    return getBookBox().values.toList();
  }

  BookVO? getSingleBook(String title){
    return getBookBox().get(title);
  }

  ///Reactive Programming
  Stream<void> getAllBookEventStream(){
    return getBookBox().watch();
  }

  Stream<List<BookVO>?> getAllBookStream(){
    return Stream.value(getAllBooks());
  }

  Stream<BookVO?> getSingleBookStream(String title){
    return Stream.value(getSingleBook(title));
  }

  List<BookVO>? getBooks(){
    if(getAllBooks()!.isNotEmpty){
      debugPrint("Database book===>${getAllBooks()}");
      return getAllBooks();
    }else{
      return [];
    }
  }

  BookVO? getBook(String title){
    if(getSingleBook(title) !=null){
      return getSingleBook(title);
    }else{
      return null;
    }
  }

  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }

}