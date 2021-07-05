// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticlesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) {
  return ArticlesResponse(
    json['source'] == null
        ? null
        : SourceResponse.fromJson(json['source'] as Map<String, dynamic>),
    json['author'] as String?,
    json['title'] as String?,
    json['description'] as String?,
    json['url'] as String?,
    json['urlToImage'] as String?,
    json['publishedAt'] as String?,
    json['content'] as String?,
  );
}

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'source': instance.source?.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
