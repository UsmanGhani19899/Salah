// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      error: json['error'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      name: json['name'] as String,
      flag: json['flag'] as String,
      iso2: json['iso2'] as String,
      iso3: json['iso3'] as String,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
    };
