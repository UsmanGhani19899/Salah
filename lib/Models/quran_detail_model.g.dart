// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranDetailTextModel _$QuranDetailTextModelFromJson(
        Map<String, dynamic> json) =>
    QuranDetailTextModel(
      code: json['code'] as int,
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuranDetailTextModelToJson(
        QuranDetailTextModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      surahs: (json['surahs'] as List<dynamic>)
          .map((e) => Surah.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: Edition.fromJson(json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'surahs': instance.surahs.map((e) => e.toJson()).toList(),
      'edition': instance.edition.toJson(),
    };

Edition _$EditionFromJson(Map<String, dynamic> json) => Edition(
      identifier: json['identifier'] as String,
      language: json['language'] as String,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      format: json['format'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$EditionToJson(Edition instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
    };

Surah _$SurahFromJson(Map<String, dynamic> json) => Surah(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      revelationType:
          $enumDecode(_$RevelationTypeEnumMap, json['revelationType']),
      ayahs: (json['ayahs'] as List<dynamic>)
          .map((e) => Ayah.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahToJson(Surah instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': _$RevelationTypeEnumMap[instance.revelationType]!,
      'ayahs': instance.ayahs.map((e) => e.toJson()).toList(),
    };

const _$RevelationTypeEnumMap = {
  RevelationType.MECCAN: 'MECCAN',
  RevelationType.MEDINAN: 'MEDINAN',
};

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      number: json['number'] as int,
      audio: json['audio'] as String,
      audioSecondary: (json['audioSecondary'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      text: json['text'] as String,
      numberInSurah: json['numberInSurah'] as int,
      juz: json['juz'] as int,
      manzil: json['manzil'] as int,
      page: json['page'] as int,
      ruku: json['ruku'] as int,
      hizbQuarter: json['hizbQuarter'] as int,
      sajda: json['sajda'],
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'number': instance.number,
      'audio': instance.audio,
      'audioSecondary': instance.audioSecondary,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };

SajdaClass _$SajdaClassFromJson(Map<String, dynamic> json) => SajdaClass(
      id: json['id'] as int,
      recommended: json['recommended'] as bool,
      obligatory: json['obligatory'] as bool,
    );

Map<String, dynamic> _$SajdaClassToJson(SajdaClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recommended': instance.recommended,
      'obligatory': instance.obligatory,
    };
