import 'package:flutter/material.dart';

import '../data/models/book_model.dart';
import '../data/models/book_model_impl.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';

class ProviderShelfBloc extends ChangeNotifier {
  /// State
  List<BookVO>? bookListInShelf;
  List<ShelfVO>? shelfList;
  bool isDispose = false;
  /// Model
  BookModel mBookModel = BookModelImpl();

  ProviderShelfBloc() {

    mBookModel.getBooksFromDatabase().listen((books) {
      if(books?.isNotEmpty?? false){
        bookListInShelf =
            books?.where((element) => element.isAddedShelf ?? false).toList();
        notifySafely();
      }
    }).onError((error) {
      debugPrint(error.toString());
    });

    mBookModel.getShelvesDatabase().listen((shelves) async {
      shelfList = shelves;
      debugPrint("shelfList=>${shelfList}");
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }
  void saveAllShelves(List<ShelfVO?>? shelfList) {
    mBookModel.saveAllShelves(shelfList);
    notifySafely();
  }

  void notifySafely(){
    if( isDispose== false){
      notifyListeners();
    }
  }
}
