import 'package:json_annotation/json_annotation.dart';
part 'prayer_Time_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrayerTimeModel {
  int code;
  String status;
  Data data;

  PrayerTimeModel({
    required this.code,
    required this.status,
    required this.data,
  });
  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return _$PrayerTimeModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PrayerTimeModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Data {
  Timings timings;
  Date date;
  Meta meta;

  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Date {
  String readable;
  String timestamp;
  Hijri hijri;
  Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });
  factory Date.fromJson(Map<String, dynamic> json) {
    return _$DateFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DateToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Gregorian {
  String date;
  String format;
  String day;
  GregorianWeekday weekday;
  GregorianMonth month;
  String year;
  Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });
  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return _$GregorianFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GregorianToJson(this);
  }
}

@JsonSerializable()
class Designation {
  String abbreviated;
  String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });
  factory Designation.fromJson(Map<String, dynamic> json) {
    return _$DesignationFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DesignationToJson(this);
  }
}

@JsonSerializable()
class GregorianMonth {
  int number;
  String en;

  GregorianMonth({
    required this.number,
    required this.en,
  });
  factory GregorianMonth.fromJson(Map<String, dynamic> json) {
    return _$GregorianMonthFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GregorianMonthToJson(this);
  }
}

@JsonSerializable()
class GregorianWeekday {
  String en;

  GregorianWeekday({
    required this.en,
  });
  factory GregorianWeekday.fromJson(Map<String, dynamic> json) {
    return _$GregorianWeekdayFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GregorianWeekdayToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Hijri {
  String date;
  String format;
  String day;
  HijriWeekday weekday;
  HijriMonth month;
  String year;
  Designation designation;
  List<dynamic> holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });
  factory Hijri.fromJson(Map<String, dynamic> json) {
    return _$HijriFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$HijriToJson(this);
  }
}

@JsonSerializable()
class HijriMonth {
  int number;
  String en;
  String ar;

  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });
  factory HijriMonth.fromJson(Map<String, dynamic> json) {
    return _$HijriMonthFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$HijriMonthToJson(this);
  }
}

@JsonSerializable()
class HijriWeekday {
  String en;
  String ar;

  HijriWeekday({
    required this.en,
    required this.ar,
  });
  factory HijriWeekday.fromJson(Map<String, dynamic> json) {
    return _$HijriWeekdayFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$HijriWeekdayToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Meta {
  double latitude;
  double longitude;
  String timezone;
  Method method;
  String latitudeAdjustmentMethod;
  String midnightMode;
  String school;
  Map<String, int> offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });
  factory Meta.fromJson(Map<String, dynamic> json) {
    return _$MetaFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MetaToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Method {
  int id;
  String name;
  Params params;
  Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });
  factory Method.fromJson(Map<String, dynamic> json) {
    return _$MethodFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MethodToJson(this);
  }
}

@JsonSerializable()
class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });
  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable()
class Params {
  int fajr;
  int isha;

  Params({
    required this.fajr,
    required this.isha,
  });
  factory Params.fromJson(Map<String, dynamic> json) {
    return _$ParamsFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ParamsToJson(this);
  }
}

@JsonSerializable()
class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;
  String firstthird;
  String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });
  factory Timings.fromJson(Map<String, dynamic> json) {
    return _$TimingsFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$TimingsToJson(this);
  }
}
