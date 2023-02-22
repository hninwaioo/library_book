import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/book_vo.dart';

import '../../persistence/hive_constants.dart';
part 'main_list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_MAIN_LIST_VO, adapterName : "MainListVOAdapter")
class MainListBookSectionVO {

  // "list_id": 704,
  @JsonKey(name: "list_id")
  @HiveField(0)
  int? listId;

  // "list_name": "Combined Print and E-Book Fiction",
  @JsonKey(name: "list_name")
  @HiveField(1)
  String? listName;

  // "list_name_encoded": "combined-print-and-e-book-fiction",
  @JsonKey(name: "list_name_encoded")
  @HiveField(2)
  String? listNameEncoded;

  // "display_name": "Combined Print & E-Book Fiction",
  @JsonKey(name: "display_name")
  @HiveField(3)
  String? displayName;

  // "updated": "WEEKLY",
  @JsonKey(name: "updated")
  @HiveField(4)
  String? updated;

  // "list_image": null,
  @JsonKey(name: "list_image")
  @HiveField(5)
  String? listImage;

  // "list_image_width": null,
  @JsonKey(name: "list_image_width")
  @HiveField(6)
  String? listImageWidth;

  // "list_image_height": null,
  @JsonKey(name: "list_image_height")
  @HiveField(7)
  String? listImageHeight;

  // books
  @JsonKey(name: "books")
  @HiveField(8)
  List<BookVO>? books;

  MainListBookSectionVO(
      this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books);

  factory MainListBookSectionVO.fromJson(Map<String,dynamic> json) => _$MainListBookSectionVOFromJson(json);
  Map<String,dynamic> toJson() => _$MainListBookSectionVOToJson(this);

  @override
  String toString() {
    return 'MainListVO{listId: $listId, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, books: $books}';
  }
}