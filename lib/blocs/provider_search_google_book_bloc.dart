import 'package:flutter/cupertino.dart';
import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_vo.dart';

class ProviderSearchGoogleBookBloc extends ChangeNotifier{
  ///States
  List<BookVO>? bookList;
  bool isDispose=false;
  ///Model
  BookModel mBookModel = BookModelImpl();

  ProviderSearchGoogleBookBloc(String searchBookName){

  }

  void searchBook(String searchBookName){
    _getBookListBySearchBookName(searchBookName);
  }

  void _getBookListBySearchBookName(String searchBookName){
    ///Book List from Google
    mBookModel.getSearchGoogleBookList(searchBookName).then((books){
      bookList = books;
      debugPrint("Searching Book===>$bookList");
      notifySafely();
    });

  }

  void notifySafely(){
    if(isDispose==false){
      notifyListeners();
    }
  }

}