import 'package:json_annotation/json_annotation.dart';
import '../book_vo.dart';
import 'volume_info_vo.dart';

part 'google_book_vo.g.dart';

@JsonSerializable()
class GoogleBookVO{
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "selfLink")
  String? selfLink;

  @JsonKey(name: "volumeInfo")
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  BookVO convertToBookVO(String bookListName){
    return BookVO(

      "",
        "",
        "",
        volumeInfo?.authors?.first,
        volumeInfo?.imageLinks?.smallThumbnail,
        0,
        0,
        "",
        "",
        "",
        "",
        volumeInfo?.description,
        "",
        "",
        "",
        "",
        "",
        "",
        0,
        0,
        "",
        volumeInfo?.title ,
        "",
        0,
        [],
        "",
      bookListName,
        false,
        false,
        );
  }


  GoogleBookVO(this.kind, this.id, this.selfLink, this.volumeInfo,
      this.nextPublishedDate);

  factory GoogleBookVO.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookVOToJson(this);

  @override
  String toString() {
    return 'GoogleBookVO{kind: $kind, id: $id, selfLink: $selfLink, volumeInfo: $volumeInfo, nextPublishedDate: $nextPublishedDate}';
  }
}




