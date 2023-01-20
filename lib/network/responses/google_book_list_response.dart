import 'package:json_annotation/json_annotation.dart';
import '../../data/vos/google_vos/google_book_vo.dart';

part 'google_book_list_response.g.dart';

@JsonSerializable()
class GoogleBookListResponse{
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "totalItems")
  int? totalItems;

  @JsonKey(name: "items")
  List<GoogleBookVO>? bookItems;


  GoogleBookListResponse(this.kind, this.totalItems, this.bookItems);

  factory GoogleBookListResponse.fromJson(Map<String,dynamic> json)=>_$GoogleBookListResponseFromJson(json);

  Map<String,dynamic> toJson()=>_$GoogleBookListResponseToJson(this);

  @override
  String toString() {
    return 'GoogleBookListResponse{kind: $kind, totalItems: $totalItems, items: $bookItems}';
  }
}
