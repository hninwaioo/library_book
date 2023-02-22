import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';

import '../../../data/vos/main_list_vo.dart';
import '../../hive_constants.dart';
import '../book_main_list_dao.dart';


class BookMainListDaoImpl extends BookMainListDao{

  static final BookMainListDaoImpl _singleton = BookMainListDaoImpl._internal();

  factory BookMainListDaoImpl() {
    return _singleton;
  }
  BookMainListDaoImpl._internal();

  void savedAllBooksMainList(List<MainListBookSectionVO?>? bookMainList)async{
    Map<String, MainListBookSectionVO> bookMainListMap = Map.fromIterable(bookMainList??[],
        key: (bookMain) => bookMain.listName, value: (bookMain) => bookMain);
    await getBookMainBox().putAll(bookMainListMap);
  }

  void savedBookMainList(MainListBookSectionVO bookCategory)async{
    return getBookMainBox().put(bookCategory.listName, bookCategory);
  }

  List<MainListBookSectionVO> getAllBooksMainList(){
    return getBookMainBox().values.toList();
  }

 MainListBookSectionVO? getSingleBookMainList(String listName){
    return getBookMainBox().get(listName);
  }

///Reactive Programming
  Stream<void> getAllBookMainListEventStream(){
    return getBookMainBox().watch();
  }

  Stream<List<MainListBookSectionVO>> getAllBookCategoriesStream(){
    return Stream.value(getAllBooksMainList());
  }

  Stream<MainListBookSectionVO?> getSingleBookMainListStream(String listName){
    return Stream.value(getSingleBookMainList(listName));
  }

  List<MainListBookSectionVO> getAllBookMainList(){
    if(getAllBooksMainList().isNotEmpty){
      return getAllBooksMainList();
    }else{
      return [];
    }
  }

  MainListBookSectionVO? getBookMainList(String listName){
    if(getSingleBookMainList(listName) !=null){
      return getSingleBookMainList(listName);
    }else{
      return null;
    }
  }


  Box<MainListBookSectionVO> getBookMainBox() {
    return Hive.box<MainListBookSectionVO>(BOX_NAME_MAIN_LIST_VO);
  }

  @override
  Stream<List<MainListBookSectionVO>> getAllBooksMainListStream() {
    return Stream.value(getAllBooksMainList());

  }

  @override
  void saveAllBooks(List<BookVO?>? bookList) {
    // TODO: implement saveAllBooks
  }

}