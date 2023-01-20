import 'package:flutter/cupertino.dart';
import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_vo.dart';

class ProviderBookDetailsBloc extends ChangeNotifier{
  BookVO? book;
  bool isDispose=false;

  ///Model
  BookModel mBookModel = BookModelImpl();

  ProviderBookDetailsBloc(String listName,String title,
      String openedDate
      ){
    // saveBook(bookVO!);
    saveBook(listName,title,openedDate);


    ///Get Book From Database
    mBookModel.getSingleBookFromDatabase(title??"")?.listen((bookDetails) {
      book = bookDetails;
      notifyListeners();
      debugPrint("BookTitle ==>${book?.title}");
    }).onError((error){
      debugPrint("Error==>$error");
    });
  }
  void saveBook(String listName,String title,String openedDate){
   mBookModel.saveBookToDatabase(listName,title,
       openedDate
   );
   notifyListeners();
  }

  // void saveBook(BookVO bookVO){
  //   mBookModel.saveBookToDatabase(bookVO);
  //   notifyListeners();
  // }

}