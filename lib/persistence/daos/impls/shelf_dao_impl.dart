import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/vos/shelf_vo.dart';
import '../../hive_constants.dart';
import '../shelf_dao.dart';

class ShelfDaoImpl extends ShelfDao {
  static final ShelfDaoImpl _singleton = ShelfDaoImpl._internal();

  factory ShelfDaoImpl() {
    return _singleton;
  }
  ShelfDaoImpl._internal();

  /// Persistence
  @override
  void saveAllShelves(List<ShelfVO?>? shelfList) async {
    Map<String?, ShelfVO> shelfMap = Map.fromIterable(shelfList ?? [],
        key: (shelf) => shelf.shelfName, value: (shelf) => shelf);
    await getShelfBox().putAll(shelfMap);
  }

  @override
  void saveSingleShelf(ShelfVO? shelf) async {
    await getShelfBox().put(shelf?.shelfName, shelf!);
  }

  @override
  void deleteShelf(String? shelfName) async {
    await getShelfBox().delete(shelfName);
  }

  @override
  List<ShelfVO>? getAllShelves() {
    return getShelfBox().values.toList();
  }

  @override
  ShelfVO? getShelf(String? shelfName) {
    return getShelfBox().get(shelfName);
  }

  /// Reactive
  @override
  Stream<List<ShelfVO>?> getAllShelvesStream() {
    return Stream.value(getAllShelves());
  }

  @override
  Stream<void> getAllShelvesEventStream() {
    return getShelfBox().watch();
  }

  @override
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName) {
    return Stream.value(getShelf(shelfName));
  }

  /// Box
  Box<ShelfVO> getShelfBox() {
    return Hive.box<ShelfVO>(BOX_NAME_SHELF_VO);
  }
}
