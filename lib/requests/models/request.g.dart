// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      bankImage: json['bankImage'] as String,
      bankName: json['bankName'] as String,
      type: json['type'] as String,
      purpose: json['purpose'] as String,
      date: DateTime.parse(json['date'] as String),
      effect: json['effect'] as String,
      effectIcon: json['effectIcon'] as String,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'bankImage': instance.bankImage,
      'bankName': instance.bankName,
      'type': instance.type,
      'purpose': instance.purpose,
      'date': instance.date.toIso8601String(),
      'effect': instance.effect,
      'effectIcon': instance.effectIcon,
    };
