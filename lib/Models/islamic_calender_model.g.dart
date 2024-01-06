// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islamic_calender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IslamicCalenderModel _$IslamicCalenderModelFromJson(
        Map<String, dynamic> json) =>
    IslamicCalenderModel(
      code: json['code'] as int,
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IslamicCalenderModelToJson(
        IslamicCalenderModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      hijri: Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
      gregorian: Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'hijri': instance.hijri.toJson(),
      'gregorian': instance.gregorian.toJson(),
    };

Gregorian _$GregorianFromJson(Map<String, dynamic> json) => Gregorian(
      date: json['date'] as String,
      format: json['format'] as String,
      day: json['day'] as String,
      weekday:
          GregorianWeekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: GregorianMonth.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
      designation:
          Designation.fromJson(json['designation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GregorianToJson(Gregorian instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday.toJson(),
      'month': instance.month.toJson(),
      'year': instance.year,
      'designation': instance.designation.toJson(),
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
      abbreviated: json['abbreviated'] as String,
      expanded: json['expanded'] as String,
    );

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

GregorianMonth _$GregorianMonthFromJson(Map<String, dynamic> json) =>
    GregorianMonth(
      number: json['number'] as int,
      en: json['en'] as String,
    );

Map<String, dynamic> _$GregorianMonthToJson(GregorianMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
    };

GregorianWeekday _$GregorianWeekdayFromJson(Map<String, dynamic> json) =>
    GregorianWeekday(
      en: json['en'] as String,
    );

Map<String, dynamic> _$GregorianWeekdayToJson(GregorianWeekday instance) =>
    <String, dynamic>{
      'en': instance.en,
    };

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
      date: json['date'] as String,
      format: json['format'] as String,
      day: json['day'] as String,
      weekday: HijriWeekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: HijriMonth.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
      designation:
          Designation.fromJson(json['designation'] as Map<String, dynamic>),
      holidays: json['holidays'] as List<dynamic>,
    );

Map<String, dynamic> _$HijriToJson(Hijri instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday.toJson(),
      'month': instance.month.toJson(),
      'year': instance.year,
      'designation': instance.designation.toJson(),
      'holidays': instance.holidays,
    };

HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) => HijriMonth(
      number: json['number'] as int,
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$HijriMonthToJson(HijriMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };

HijriWeekday _$HijriWeekdayFromJson(Map<String, dynamic> json) => HijriWeekday(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$HijriWeekdayToJson(HijriWeekday instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };
