import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/main_list_vo.dart';
part 'get_books_by_list_response.g.dart';
@JsonSerializable()
class GetBooksByListNameResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyRight;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  List<MainListBookSectionVO?>? result;

  GetBooksByListNameResponse(this.status, this.copyRight, this.numResults,
      this.lastModified, this.result);

  factory GetBooksByListNameResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBooksByListNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBooksByListNameResponseToJson(this);

  @override
  String toString() {
    return 'GetBooksByListName{status: $status, copyRight: $copyRight, numResults: $numResults, lastModified: $lastModified, result: $result}';
  }
}
