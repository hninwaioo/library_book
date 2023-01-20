import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/book_vo.dart';
import '../../persistence/hive_constants.dart';
part 'shelf_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_SHELF_V0, adapterName: "ShelfVOAdapter")
class ShelfVO {

  @JsonKey(name: "shelf_name")
  @HiveField(0)
  String? shelfName;

  @JsonKey(name: "books")
  @HiveField(1)
  List<BookVO>? shelfBooks;

  @JsonKey(name: "is_checked")
  @HiveField(2)
  bool isChecked;

  ShelfVO(this.shelfBooks, this.shelfName, this.isChecked);

  factory ShelfVO.fromJson(Map<String,dynamic> json) => _$ShelfVOFromJson(json);
  Map<String,dynamic> toJson() => _$ShelfVOToJson(this);

  @override
  String toString() {
    return 'ShelfVO{shelfName: $shelfName, shelfBooks: $shelfBooks, isChecked: $isChecked}';
  }
}