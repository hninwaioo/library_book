import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/main_list_vo.dart';


abstract class BookDao {
  // void savedAllBooksMainList(List<MainListVO> movies);
  // void savedSingleBookMainList(MainListVO? movie);
  // MainListVO? getBookById(int movieId);
  // List<MainListVO> getAllBooksMainList();
  // Stream<void> getAllEBooksEventStream();
  // Stream<List<MainListVO>> getAllEbooksStream();
  // List<MainListVO> getAllEbooksList();

  /// BookVO
  void savedAllBooks(List<BookVO?> books);
  void savedSingleBook(BookVO? book);
  List<BookVO>? getAllBooks();
  Stream<void> getAllBookEventStream();
  Stream<List<BookVO>?> getAllBookStream();
  Stream<BookVO?> getSingleBookStream(String title);
  List<BookVO>? getBooks();
  BookVO? getBook(String title);
}