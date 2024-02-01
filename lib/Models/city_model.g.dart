// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      totalResultsCount: json['totalResultsCount'] as int?,
      geonames: (json['geonames'] as List<dynamic>?)
          ?.map((e) => Geoname.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'totalResultsCount': instance.totalResultsCount,
      'geonames': instance.geonames?.map((e) => e.toJson()).toList(),
    };

Geoname _$GeonameFromJson(Map<String, dynamic> json) => Geoname(
      adminCode1: json['adminCode1'] as String?,
      lng: json['lng'] as String?,
      geonameId: json['geonameId'] as int?,
      toponymName: json['toponymName'] as String?,
      countryId: json['countryId'] as String?,
      population: json['population'] as int,
      name: json['name'] as String?,
      adminCodes1: json['adminCodes1'] == null
          ? null
          : AdminCodes1.fromJson(json['adminCodes1'] as Map<String, dynamic>),
      adminName1: json['adminName1'] as String?,
      lat: json['lat'] as String?,
    );

Map<String, dynamic> _$GeonameToJson(Geoname instance) => <String, dynamic>{
      'adminCode1': instance.adminCode1,
      'lng': instance.lng,
      'geonameId': instance.geonameId,
      'toponymName': instance.toponymName,
      'countryId': instance.countryId,
      'population': instance.population,
      'name': instance.name,
      'adminCodes1': instance.adminCodes1?.toJson(),
      'adminName1': instance.adminName1,
      'lat': instance.lat,
    };

AdminCodes1 _$AdminCodes1FromJson(Map<String, dynamic> json) => AdminCodes1(
      iso31662: json['iso31662'] as String?,
    );

Map<String, dynamic> _$AdminCodes1ToJson(AdminCodes1 instance) =>
    <String, dynamic>{
      'iso31662': instance.iso31662,
    };
