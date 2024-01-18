import 'package:json_annotation/json_annotation.dart';
part 'surah_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SurahModel {
  List<Suwar> suwar;

  SurahModel({
    required this.suwar,
  });
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return _$SurahModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SurahModelToJson(this);
  }
}

@JsonSerializable()
class Suwar {
  int? id;
  String? name;
  int? startPage;
  int? endPage;
  int? makkia;
  int? type;

  Suwar({
    required this.id,
    required this.name,
    required this.startPage,
    required this.endPage,
    required this.makkia,
    required this.type,
  });
  factory Suwar.fromJson(Map<String, dynamic> json) {
    return _$SuwarFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SuwarToJson(this);
  }
}
