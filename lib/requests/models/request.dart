import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';


@JsonSerializable()
class Request {
  @JsonKey(name: 'bankImage')
  String bankImage;
  @JsonKey(name: 'bankName')
  String bankName;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'purpose')
  String purpose;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'effect')
  String effect;
  @JsonKey(name: 'effectIcon')
  String effectIcon;

  Request({required this.bankImage, required this.bankName, required this.type, required this.purpose, required this.date, required this.effect, required this.effectIcon});

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);

}