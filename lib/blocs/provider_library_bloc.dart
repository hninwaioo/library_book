import 'package:flutter/material.dart';

import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';

class ProviderLibraryBloc extends ChangeNotifier {
  ///States
  List<BookVO>? bookListInLibrary;
  List<String> bookMainListName=[];
  List<ShelfVO>? shelfList;
  bool isDispose=false;

  ///Model
  BookModel mBookModel=BookModelImpl();

  ProviderLibraryBloc(String shelfName){
    ///Get Books List from Database
    mBookModel.getBooksFromDatabase().listen((books) {
      bookListInLibrary =
          books?.where((element) => element.isAddedLibrary ?? false).toList();
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });


    // ///Get Shelves From Database
    // bBookModel.getAllShelfFromDatabase()?.listen((shelves) {
    //   shelfList=shelves;
    //   debugPrint("Shelf List From Database===>$shelfList");
    //   //debugPrint("Book List From Shelf===>${shelfList?[0].bookList}");
    //   notifyListeners();
    // }).onError((error){
    //   debugPrint("Shelf List From Database===>$error");
    // });

    /// Get Shelves From database
    mBookModel.getShelvesDatabase().listen((shelves) {
      shelfList = shelves;
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }


  void saveAllBooks(List<BookVO?>? bookList) {
    mBookModel.savedBooksToLibrary(bookList??[]);
  }

  void saveAllShelves(List<ShelfVO>? shelfList) {
    mBookModel.saveAllShelves(shelfList);
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }

}