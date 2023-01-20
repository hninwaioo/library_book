import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/book_vo.dart';

import '../../persistence/hive_constants.dart';
import 'main_list_vo.dart';
part 'results_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_RESULTS_VO, adapterName : "ResultsVOAdapter")

class ResultsVO {

  // "bestsellers_date": "2022-11-19",
  @JsonKey(name: "bestsellers_date")
  @HiveField(0)
  String? bestsellersDate;

  // "published_date": "2022-12-04",
  @JsonKey(name: "published_date")
  @HiveField(1)
  String? publishedDate;

  // "published_date_description": "latest",
  @JsonKey(name: "published_date_description")
  @HiveField(2)
  String? publishedDateDescription;

  // "previous_published_date": "2022-11-27",
  @JsonKey(name: "previous_published_date")
  @HiveField(3)
  String? previousPublishedDate;

  // "next_published_date": "",
  @JsonKey(name: "next_published_date")
  @HiveField(4)
  String? nextPublishedDate;

  //lists
  @JsonKey(name: "lists")
  @HiveField(5)
  List<MainListVO>? lists;

  ResultsVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory ResultsVO.fromJson(Map<String,dynamic> json) => _$ResultsVOFromJson(json);
  Map<String,dynamic> toJson() => _$ResultsVOToJson(this);

  @override
  String toString() {
    return 'ResultsVO{bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, lists: $lists}';
  }

}