import 'package:json_annotation/json_annotation.dart';

part 'SourceResponse.g.dart';

@JsonSerializable()
class SourceResponse {
  String? id;
  String? name;

  SourceResponse(this.id, this.name);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);

  static SourceResponse fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);
}
