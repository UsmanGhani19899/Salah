import 'package:json_annotation/json_annotation.dart';
part 'quran_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuranDetailTextModel {
  int code;
  String status;
  Data data;

  QuranDetailTextModel({
    required this.code,
    required this.status,
    required this.data,
  });
  factory QuranDetailTextModel.fromJson(Map<String, dynamic> json) {
    return _$QuranDetailTextModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$QuranDetailTextModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Data {
  List<Surah> surahs;
  Edition edition;

  Data({
    required this.surahs,
    required this.edition,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Edition {
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });
  factory Edition.fromJson(Map<String, dynamic> json) {
    return _$EditionFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$EditionToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Surah {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  RevelationType revelationType;
  List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });
  factory Surah.fromJson(Map<String, dynamic> json) {
    return _$SurahFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SurahToJson(this);
  }
}

@JsonSerializable()
class Ayah {
  int number;
  String audio;
  List<String> audioSecondary;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  dynamic sajda;

  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
  factory Ayah.fromJson(Map<String, dynamic> json) {
    return _$AyahFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$AyahToJson(this);
  }
}

@JsonSerializable()
class SajdaClass {
  int id;
  bool recommended;
  bool obligatory;

  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });
  factory SajdaClass.fromJson(Map<String, dynamic> json) {
    return _$SajdaClassFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$SajdaClassToJson(this);
  }
}

enum RevelationType { Meccan, Medinan }
