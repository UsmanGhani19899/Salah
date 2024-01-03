import 'package:json_annotation/json_annotation.dart';
part 'asma_ul_husna_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AsmaUlHusnaModel {
  int code;
  String status;
  List<Datum> data;

  AsmaUlHusnaModel({
    required this.code,
    required this.status,
    required this.data,
  });
  factory AsmaUlHusnaModel.fromJson(Map<String, dynamic> json) {
    return _$AsmaUlHusnaModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$AsmaUlHusnaModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Datum {
  String name;
  String transliteration;
  int number;
  En en;

  Datum({
    required this.name,
    required this.transliteration,
    required this.number,
    required this.en,
  });
  factory Datum.fromJson(Map<String, dynamic> json) {
    return _$DatumFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DatumToJson(this);
  }
}

@JsonSerializable()
class En {
  String meaning;

  En({
    required this.meaning,
  });
  factory En.fromJson(Map<String, dynamic> json) {
    return _$EnFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$EnToJson(this);
  }
}
