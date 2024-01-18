import 'package:json_annotation/json_annotation.dart';
part 'quran_reciters_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuranReciter {
  List<Reciter> reciters;

  QuranReciter({
    required this.reciters,
  });
  factory QuranReciter.fromJson(Map<String, dynamic> json) {
    return _$QuranReciterFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$QuranReciterToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Reciter {
  int? id;
  String? name;
  String? letter;
  List<Moshaf> moshaf;

  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.moshaf,
  });
  factory Reciter.fromJson(Map<String, dynamic> json) {
    return _$ReciterFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ReciterToJson(this);
  }
}

@JsonSerializable()
class Moshaf {
  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Moshaf({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.moshafType,
    required this.surahList,
  });
  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return _$MoshafFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MoshafToJson(this);
  }
}
