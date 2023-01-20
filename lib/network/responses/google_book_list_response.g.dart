// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookListResponse _$GoogleBookListResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleBookListResponse(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => GoogleBookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoogleBookListResponseToJson(
        GoogleBookListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.bookItems,
    };
