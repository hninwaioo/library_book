import '../../data/vos/book_vo.dart';
import '../../data/vos/main_list_vo.dart';

abstract class BookMainListDao{
  // void saveAllBookSection(List<BookSectionVO?>? bookSectionList);

  void savedAllBooksMainList(List<MainListBookSectionVO?>? bookMainList);
  void savedBookMainList(MainListBookSectionVO mainListVO);
  List<MainListBookSectionVO> getAllBooksMainList();
  MainListBookSectionVO? getSingleBookMainList(String listName);
  Stream<void> getAllBookMainListEventStream();
  Stream<List<MainListBookSectionVO>> getAllBooksMainListStream();
  Stream<MainListBookSectionVO?> getSingleBookMainListStream(String listName);
  List<MainListBookSectionVO> getAllBookMainList();
  MainListBookSectionVO? getBookMainList(String listName);
}