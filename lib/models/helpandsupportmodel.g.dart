// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpandsupportmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpAndSupportModel _$HelpAndSupportModelFromJson(Map<String, dynamic> json) =>
    HelpAndSupportModel(
      title: json['title'] as String?,
      id: json['id'] as String?,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$HelpAndSupportModelToJson(
        HelpAndSupportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
