// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asma_ul_husna_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsmaUlHusnaModel _$AsmaUlHusnaModelFromJson(Map<String, dynamic> json) =>
    AsmaUlHusnaModel(
      code: json['code'] as int,
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AsmaUlHusnaModelToJson(AsmaUlHusnaModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      name: json['name'] as String,
      transliteration: json['transliteration'] as String,
      number: json['number'] as int,
      en: En.fromJson(json['en'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'name': instance.name,
      'transliteration': instance.transliteration,
      'number': instance.number,
      'en': instance.en.toJson(),
    };

En _$EnFromJson(Map<String, dynamic> json) => En(
      meaning: json['meaning'] as String,
    );

Map<String, dynamic> _$EnToJson(En instance) => <String, dynamic>{
      'meaning': instance.meaning,
    };
