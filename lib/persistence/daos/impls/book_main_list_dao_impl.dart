import 'package:hive/hive.dart';

import '../../../data/vos/main_list_vo.dart';
import '../../hive_constants.dart';
import '../book_main_list_dao.dart';


class BookMainListDaoImpl extends BookMainListDao{

  static final BookMainListDaoImpl _singleton = BookMainListDaoImpl._internal();

  factory BookMainListDaoImpl() {
    return _singleton;
  }
  BookMainListDaoImpl._internal();

  void savedAllBooksMainList(List<MainListVO> bookMainList)async{
    Map<String, MainListVO> bookMainListMap = Map.fromIterable(bookMainList,
        key: (bookMain) => bookMain.listName, value: (bookMain) => bookMain);
    await getBookMainBox().putAll(bookMainListMap);
  }

  void savedBookMainList(MainListVO bookCategory)async{
    return getBookMainBox().put(bookCategory.listName, bookCategory);
  }

  List<MainListVO> getAllBooksMainList(){
    return getBookMainBox().values.toList();
  }

 MainListVO? getSingleBookMainList(String listName){
    return getBookMainBox().get(listName);
  }

///Reactive Programming
  Stream<void> getAllBookMainListEventStream(){
    return getBookMainBox().watch();
  }

  Stream<List<MainListVO>> getAllBookCategoriesStream(){
    return Stream.value(getAllBooksMainList());
  }

  Stream<MainListVO?> getSingleBookMainListStream(String listName){
    return Stream.value(getSingleBookMainList(listName));
  }

  List<MainListVO> getAllBookMainList(){
    if(getAllBooksMainList().isNotEmpty){
      return getAllBooksMainList();
    }else{
      return [];
    }
  }

  MainListVO? getBookMainList(String listName){
    if(getSingleBookMainList(listName) !=null){
      return getSingleBookMainList(listName);
    }else{
      return null;
    }
  }


  Box<MainListVO> getBookMainBox() {
    return Hive.box<MainListVO>(BOX_NAME_MAIN_LIST_VO);
  }

  @override
  Stream<List<MainListVO>> getAllBooksMainListStream() {
    return Stream.value(getAllBooksMainList());

  }

}