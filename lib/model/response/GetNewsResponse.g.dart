// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetNewsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewsResponse _$GetNewsResponseFromJson(Map<String, dynamic> json) {
  return GetNewsResponse(
    json['status'] as String?,
    json['totalResult'] as int?,
    (json['articles'] as List<dynamic>?)
        ?.map((e) => ArticlesResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetNewsResponseToJson(GetNewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResult': instance.totalResult,
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
    };
