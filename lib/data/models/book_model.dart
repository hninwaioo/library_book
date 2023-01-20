import 'package:scoped_model/scoped_model.dart';

import '../vos/book_vo.dart';
import '../vos/main_list_vo.dart';
import '../vos/results_vo.dart';
import '../vos/shelf_vo.dart';

abstract class BookModel extends Model {
  /// Network
  Future<ResultsVO?> getOverviewBooks();
// void getNowPlayingMovies(int page);
  Future<List<BookVO>?> getSearchGoogleBookList(String searchBookName);


  /// DataBase
  Stream<List<MainListVO>?> getOverviewBooksFromDatabase();
  Stream<MainListVO?>? getSingleBookOverviewFromDatabase(String listName);
  // void saveBookToDatabase(String listName,String title,String openedDate);
  void saveBookToDatabase(String listName,String title,
      String openedDate
      );


  Stream<List<BookVO>?> getBooksFromDatabase();
  Stream<BookVO?>? getSingleBookFromDatabase(String title);
  Stream<List<BookVO>?> getBooksByBookOverviewFromDatabase(String listName);
  void savedBooksToLibrary(List<BookVO?> bookList);

  Stream<List<ShelfVO>?> getShelvesDatabase();
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName);
  void saveAllShelves(List<ShelfVO>? shelfList);
  void saveSingleShelf(ShelfVO? shelf);
  void deleteShelf(String? shelfName);

  ///Database
  // Stream<List<BookCategoryVO>>? getBookCategoriesFromDatabase();
  // Stream<BookCategoryVO?>? getSingleBookCategoryFromDatabase(String listName);
  // void saveBookToDatabase(String listName,String title,String openedDate);
  // Stream<List<BookVO>>? getBooksFromDatabase();
  // Stream<BookVO?>? getSingleBookFromDatabase(String title);
  // Stream<List<BookVO>>? getBooksByBookCategoryFromDatabase(String listName);

  // void saveShelf(String shelfName);
  // Stream<List<ShelfVO>?>? getAllShelfFromDatabase();
  // void addingBookToShelf(int shelfId,BookVO book);
  // void renameShelf(String newShelfName,ShelfVO oldShelf);
  // void deleteShelfFromDatabase(int shelfId);
  // Stream<ShelfVO?>? getShelfFromDatabase(int shelfId);


}