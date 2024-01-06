// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_Time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimeModel _$PrayerTimeModelFromJson(Map<String, dynamic> json) =>
    PrayerTimeModel(
      code: json['code'] as int,
      status: json['status'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimeModelToJson(PrayerTimeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      timings: Timings.fromJson(json['timings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'timings': instance.timings.toJson(),
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
      Fajr: json['Fajr'] as String,
      Sunrise: json['Sunrise'] as String,
      Dhuhr: json['Dhuhr'] as String,
      Asr: json['Asr'] as String,
      Sunset: json['Sunset'] as String,
      Maghrib: json['Maghrib'] as String,
      Isha: json['Isha'] as String,
      Imsak: json['Imsak'] as String,
      Midnight: json['Midnight'] as String,
      Firstthird: json['Firstthird'] as String,
      Lastthird: json['Lastthird'] as String,
    );

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
      'Fajr': instance.Fajr,
      'Sunrise': instance.Sunrise,
      'Dhuhr': instance.Dhuhr,
      'Asr': instance.Asr,
      'Sunset': instance.Sunset,
      'Maghrib': instance.Maghrib,
      'Isha': instance.Isha,
      'Imsak': instance.Imsak,
      'Midnight': instance.Midnight,
      'Firstthird': instance.Firstthird,
      'Lastthird': instance.Lastthird,
    };
