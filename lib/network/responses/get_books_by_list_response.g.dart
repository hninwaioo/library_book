// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_books_by_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooksByListNameResponse _$GetBooksByListNameResponseFromJson(
        Map<String, dynamic> json) =>
    GetBooksByListNameResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['last_modified'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MainListBookSectionVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBooksByListNameResponseToJson(
        GetBooksByListNameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyRight,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.result,
    };
