// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
      suwar: (json['suwar'] as List<dynamic>)
          .map((e) => Suwar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'suwar': instance.suwar.map((e) => e.toJson()).toList(),
    };

Suwar _$SuwarFromJson(Map<String, dynamic> json) => Suwar(
      id: json['id'] as int?,
      name: json['name'] as String?,
      startPage: json['startPage'] as int?,
      endPage: json['endPage'] as int?,
      makkia: json['makkia'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$SuwarToJson(Suwar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startPage': instance.startPage,
      'endPage': instance.endPage,
      'makkia': instance.makkia,
      'type': instance.type,
    };
