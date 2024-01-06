import 'package:json_annotation/json_annotation.dart';
part 'islamic_calender_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IslamicCalenderModel {
  int code;
  String status;
  Data data;

  IslamicCalenderModel({
    required this.code,
    required this.status,
    required this.data,
  });
  factory IslamicCalenderModel.fromJson(Map<String, dynamic> json) {
    return _$IslamicCalenderModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$IslamicCalenderModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Data {
  Hijri hijri;
  Gregorian gregorian;

  Data({
    required this.hijri,
    required this.gregorian,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
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
