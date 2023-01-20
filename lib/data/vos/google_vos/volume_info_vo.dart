import 'package:json_annotation/json_annotation.dart';
import 'image_links_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO{
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "authors")
  List<String>? authors;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "pageCount")
  int? pageCount;

  @JsonKey(name: "imageLinks")
  ImageLinksVO? imageLinks;


  VolumeInfoVO(this.title, this.authors, this.publishedDate, this.description,
      this.pageCount, this.imageLinks);

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);

  @override
  String toString() {
    return 'VolumeInfoVO{title: $title, authors: $authors, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, imageLinks: $imageLinks}';
  }

}
