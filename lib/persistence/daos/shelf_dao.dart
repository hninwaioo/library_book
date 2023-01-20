import '../../data/vos/shelf_vo.dart';

abstract class ShelfDao {

  void saveAllShelves(List<ShelfVO>? shelfList);
  void saveSingleShelf(ShelfVO? shelf);
  void deleteShelf(String? shelfName);
  List<ShelfVO>? getAllShelves();
  ShelfVO? getShelf(String? shelfName);

  Stream<void> getAllShelvesEventStream();
  Stream<List<ShelfVO>?> getAllShelvesStream();
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName);

}
