import 'package:json_annotation/json_annotation.dart';
part 'feed_vo.g.dart';

@JsonSerializable()
class FeedVO {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'caption')
  String caption;
  @JsonKey(name: 'file_url')
  String fileURL;
  @JsonKey(name: 'file_type')
  String fileType;
  @JsonKey(name: 'created_at')
  String createdAt;

  FeedVO(
      {required this.id,
      required this.caption,
      required this.fileURL,
      required this.fileType,
      required this.createdAt});

  factory FeedVO.fromJson(Map<String, dynamic> json) => _$FeedVOFromJson(json);

  Map<String, dynamic> toJson() => _$FeedVOToJson(this);
}
