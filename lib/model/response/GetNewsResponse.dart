import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_skeleton/model/response/ArticlesResponse.dart';

part 'GetNewsResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class GetNewsResponse {
  String? status;
  int? totalResult;
  List<ArticlesResponse>? articles;

  GetNewsResponse(this.status, this.totalResult, this.articles);

  Map<String, dynamic> toJson() => _$GetNewsResponseToJson(this);

  static GetNewsResponse fromJson(Map<String, dynamic> json) =>
      _$GetNewsResponseFromJson(json);
}
