import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'prayer_Time_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrayerTimeModel {
  int code;
  String? status;
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

  Data({
    required this.timings,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Timings {
  String Fajr;
  String Sunrise;
  String Dhuhr;
  String Asr;
  String Sunset;
  String Maghrib;
  String Isha;
  String Imsak;
  String Midnight;
  String Firstthird;
  String Lastthird;

  Timings({
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Sunset,
    required this.Maghrib,
    required this.Isha,
    required this.Imsak,
    required this.Midnight,
    required this.Firstthird,
    required this.Lastthird,
  });
  factory Timings.fromJson(Map<String, dynamic> json) {
    return _$TimingsFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$TimingsToJson(this);
  }
}
