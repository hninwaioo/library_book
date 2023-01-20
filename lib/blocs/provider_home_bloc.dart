import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/main_list_vo.dart';
import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';

class ProviderHomeBloc extends ChangeNotifier {
  ///States
  List<MainListVO>? mMainList;
  List<BookVO>? mBookList;
  List<BookVO>? mBookListFromDatabase;
  bool isDispose = false;

  ///page
  int pageForNowPlayingMovies = 1;

  /// Model
  BookModel mBookModel = BookModelImpl();

  ProviderHomeBloc([BookModel? bookModel]) {
    /// Set Mock Model For Test Data
    if (bookModel != null) {
      mBookModel = bookModel;
    }
    // await Future.delayed(Duration(seconds: 3));
    ///Book List from Network
    // mBookModel.getOverviewBooks().then((mainList)async{
    //   await Future.delayed(Duration(seconds: 3));
    //   mMainList = mainList?.lists??[];
    //   notifyListeners();
    // });

    /// Main List DataBase
    mBookModel.getOverviewBooksFromDatabase().listen((bookList) async{
      mMainList = bookList??[];
      debugPrint("Main List From Database===>$mBookListFromDatabase");
      notifySafely();
    }).onError((error){
      debugPrint(error.toString());
    });

    /// Book List DataBase
    mBookModel.getBooksFromDatabase().listen((bookList) async {
      mBookListFromDatabase = bookList??[];
      debugPrint("Book List From Database===>$mBookListFromDatabase");
      notifySafely();

    }).onError((error){
      debugPrint(error.toString());
    });
  }
  void saveBooksToLibrary(List<BookVO?>? bookList) {
    mBookModel.savedBooksToLibrary(bookList??[]);
    notifySafely();
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }
}