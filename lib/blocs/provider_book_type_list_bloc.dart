import 'package:flutter/material.dart';

import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_vo.dart';

class ProviderBookTypeListBloc extends ChangeNotifier {
  ///States
  List<BookVO>? books;
  bool isDispose = false;

  ///Model
  BookModel mBookModel = BookModelImpl();

  ProviderBookTypeListBloc(String listName) {
    ///Book List From Database
    mBookModel.getSingleBookOverviewFromDatabase(listName)?.listen((bookList) {
      books = bookList?.books;
      debugPrint("BookError==>${books?.first.title}");
      debugPrint("MainListName==>${bookList?.listName}");
      notifyListeners();
    }).onError((error) {
      debugPrint("Bloc Error==>$error");
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
