import 'package:json_annotation/json_annotation.dart';
part 'countries_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CountriesModel {
  bool error;
  String msg;
  List<Datum> data;

  CountriesModel({
    required this.error,
    required this.msg,
    required this.data,
  });
  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return _$CountriesModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CountriesModelToJson(this);
  }
}

@JsonSerializable()
class Datum {
  String name;
  String flag;
  String iso2;
  String iso3;

  Datum({
    required this.name,
    required this.flag,
    required this.iso2,
    required this.iso3,
  });
  factory Datum.fromJson(Map<String, dynamic> json) {
    return _$DatumFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DatumToJson(this);
  }
}
