import '../../data/vos/shelf_vo.dart';

class CreateNewShelf {
  List<ShelfVO>? shelfList = [];

  void saveShelf(ShelfVO shelf) {
    shelfList?.add(shelf);
  }
}