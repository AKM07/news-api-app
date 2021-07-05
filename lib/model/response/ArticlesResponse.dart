import 'package:mobile_skeleton/model/response/SourceResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ArticlesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticlesResponse {
  SourceResponse? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesResponse(this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);

  static ArticlesResponse fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}
