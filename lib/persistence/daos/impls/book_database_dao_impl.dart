import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';
import '../../hive_constants.dart';
import '../book_database_dao.dart';

class BookDatabaseDaoImpl extends BookDatabaseDao{

  @override
  Future<Box> openBox() async{
    Box box = await Hive.openBox<BookVO>(BOX_NAME_DATABASE_BOOK_LIST);
    return box;
  }

  @override
  List<BookVO> getBookFromWishListDatabase(Box box) {
    return box.values.toList() as List<BookVO>;
  }

  @override
  Future<void> addBookToWishList(Box box, BookVO bookVO) async{
    await box.put(bookVO.title, bookVO);
  }
  @override
  Future<void> removeBookFromWishList(Box box, BookVO bookVO) async{
    await box.delete(bookVO.title);
  }

  @override
  Future<void> clearWishList(Box box) async {
    await box.clear();
  }

}