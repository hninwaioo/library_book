import '../../data/vos/main_list_vo.dart';

abstract class BookMainListDao{
  void savedAllBooksMainList(List<MainListVO> bookMainList);
  void savedBookMainList(MainListVO mainListVO);
  List<MainListVO> getAllBooksMainList();
  MainListVO? getSingleBookMainList(String listName);
  Stream<void> getAllBookMainListEventStream();
  Stream<List<MainListVO>> getAllBooksMainListStream();
  Stream<MainListVO?> getSingleBookMainListStream(String listName);
  List<MainListVO> getAllBookMainList();
  MainListVO? getBookMainList(String listName);
}