import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/main_list_vo.dart';
import 'package:library_app/data/vos/results_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/persistence/daos/impls/shelf_dao_impl.dart';
import '../../network/book_data_agent.dart';
import '../../network/retrofit_data_agent_impl.dart';
import '../../persistence/daos/book_dao.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../persistence/daos/book_main_list_dao.dart';
import '../../persistence/daos/impls/book_dao_impl.dart';
import '../../persistence/daos/impls/book_main_list_dao_impl.dart';
import '../../persistence/daos/shelf_dao.dart';
import 'book_model.dart';

class BookModelImpl extends BookModel {

  BookDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final BookModelImpl _singleton = BookModelImpl._internal();

  factory BookModelImpl(){
    return _singleton;
  }

  BookModelImpl._internal(){}

  /// Daos
  BookMainListDao mBookMainListDao = BookMainListDaoImpl();
  BookDao mBookDao = BookDaoImpl();
  ShelfDao mShelfDao = ShelfDaoImpl();

  // @override
  // Future<ResultsVO?> getOverviewBooks() {
  //   return mDataAgent.getOverviewBooks().then((mainList){
  //
  //     List<MainListVO>? mainListBook = mainList?.lists?.map((main_list){
  //       return main_list;
  //     }).toList();
  //     mBookMainListDao.savedAllBooksMainList(mainListBook??[]);
  //     mBookMainListDao.savedBookMainList(mainListBook??[].first);
  //     return Future.value(mainList);
  //   });
  // }

  @override
  Future<ResultsVO?> getOverviewBooks() {
    return mDataAgent.getOverviewBooks().then((mainList) async {
          List<MainListVO>? mainListBook = mainList?.lists?.map((main_list){
            return main_list;
          }).toList();
          mBookMainListDao.savedAllBooksMainList(mainListBook??[]);
          mBookMainListDao.savedBookMainList(mainListBook??[].first);
      return Future.value(mainList);
    });
  }

  @override
  Future<List<BookVO>?> getSearchGoogleBookList(String searchBookName){
    return mDataAgent.getBookListFromGoogle(searchBookName).then((googleBookList){
      List<BookVO>? bookList = googleBookList?.map((googleBookVO) => googleBookVO.convertToBookVO(searchBookName)).toList();
      MainListVO mainListVO  = MainListVO(0, "","", "","","", "", "", []);
      mainListVO.listName = searchBookName;
      mainListVO.books = bookList;
      mBookMainListDao.savedBookMainList(mainListVO);
      return bookList;
    });
  }

  /// Database

  @override
  Stream<List<MainListVO>?> getOverviewBooksFromDatabase() {
    getOverviewBooks().then((books) async {
      mBookMainListDao.savedAllBooksMainList(books?.lists??[]);
    });
    return mBookMainListDao
        .getAllBookMainListEventStream()
        .startWith(mBookMainListDao.getAllBooksMainListStream())
        .map((event) => mBookMainListDao.getAllBookMainList());
  }

  @override
  Stream<MainListVO?>? getSingleBookOverviewFromDatabase(String listName) {
    getOverviewBooksFromDatabase();
    return mBookMainListDao
        .getAllBookMainListEventStream()
        .startWith(mBookMainListDao.getSingleBookMainList(listName))
        .map((event) => mBookMainListDao.getBookMainList(listName));
  }

  @override
  Stream<List<BookVO>?> getBooksFromDatabase() {
    return mBookDao
        .getAllBookEventStream()
        .startWith(mBookDao.getAllBookStream())
        .map((event) => mBookDao.getBooks());
  }

  @override
  Stream<List<BookVO>?> getBooksByBookOverviewFromDatabase(String listName) {
    return mBookDao
        .getAllBookEventStream()
        .startWith(mBookDao.getAllBookStream())
        .map((event) {
      if (listName == "") {
        return mBookDao.getBooks();
      } else {
        return mBookDao
            .getBooks()
            ?.where((book) => book.title == listName)
            .toList();
      }
    });
  }

  @override
  Stream<BookVO?>? getSingleBookFromDatabase(String title) {
    return mBookDao
        .getAllBookEventStream()
        .startWith(mBookDao.getSingleBookStream(title))
        .map((event) => mBookDao.getBook(title));
  }

  // @override
  // Stream<MainListVO?>? getSingleBookOverviewFromDatabase(String listName) {
  //   getOverviewBooksFromDatabase();
  //   return bookMainListDaoImpl
  //       .getAllBookMainListEventStream()
  //       .startWith(bookMainListDaoImpl.getSingleBookMainListStream(listName))
  //       .map((event) => bookMainListDaoImpl.getBookMainList(listName));
  // }

  @override
  void saveBookToDatabase(String listName, String title,
      String openedDate
      ) {
    List<BookVO?>? books;
    getSingleBookOverviewFromDatabase(listName)?.listen((bookMainList) async {
      books = bookMainList?.books
          ?.map((book) {
        book.title = listName;
        book.openedDate = DateTime.now() as String?;
        book.openedDate = openedDate;
        // debugPrint("OpenedDate==>${openedDate}");

        if (book.title == title) {
          mBookDao.savedSingleBook(book);
          savedBooksToLibrary(books??[]);
          debugPrint("BookData==>BookDATA");
        }
        return book;
      }).cast<BookVO>()
          .toList();
      // debugPrint("BookData==>${books}");
      // debugPrint("ListName===>${book.title}");
      // debugPrint("BookDataTitle===>${book.title}");
      debugPrint("List Name==>${books?.first?.title}");
    }).onError((error){
      debugPrint("Save Book Error===>$error");
    });
  }

  @override
  void savedBooksToLibrary(List<BookVO?> bookList) {
     mBookDao.savedAllBooks(bookList);
  }

  /// Shelves
  @override
  void saveAllShelves(List<ShelfVO>? shelfList) {
    mShelfDao.saveAllShelves(shelfList);
  }

  @override
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName) {
    return mShelfDao
        .getAllShelvesEventStream()
        .startWith(mShelfDao.getSingleShelfStream(shelfName))
        .map((event) => mShelfDao.getShelf(shelfName));
  }

  @override
  void saveSingleShelf(ShelfVO? shelf) {
    mShelfDao.saveSingleShelf(shelf);
  }

  @override
  void deleteShelf(String? shelfName) {
    mShelfDao.deleteShelf(shelfName);
  }

  /// ShelfList Database
  @override
  Stream<List<ShelfVO>?> getShelvesDatabase() {
    return mShelfDao
        .getAllShelvesEventStream()
        .startWith(mShelfDao.getAllShelvesStream())
        .map((event) => mShelfDao.getAllShelves());
  }

  // @override
  // void saveBookToDatabase(BookVO bookVO) {
  //   List<BookVO>? books;
  //   getSingleBookOverviewFromDatabase(bookVO.title??"")?.listen((bookMainList) async {
  //     books = bookMainList?.books
  //         ?.map((book) {
  //       // book.title = bookVO.listName;
  //       // book.openedDate = openedDate;
  //       // if (book.title == bookVO.listName) {
  //         mBookDao.savedSingleBook(book);
  //       // }
  //       return book;
  //     }).cast<BookVO>()
  //         .toList();
  //     debugPrint("List Name==>${books?.first.title}");
  //   }).onError((error){
  //     debugPrint("Save Book Error===>$error");
  //   });
  // }

}