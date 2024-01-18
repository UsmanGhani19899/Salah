// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_reciters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranReciter _$QuranReciterFromJson(Map<String, dynamic> json) => QuranReciter(
      reciters: (json['reciters'] as List<dynamic>)
          .map((e) => Reciter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuranReciterToJson(QuranReciter instance) =>
    <String, dynamic>{
      'reciters': instance.reciters.map((e) => e.toJson()).toList(),
    };

Reciter _$ReciterFromJson(Map<String, dynamic> json) => Reciter(
      id: json['id'] as int?,
      name: json['name'] as String?,
      letter: json['letter'] as String?,
      moshaf: (json['moshaf'] as List<dynamic>)
          .map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReciterToJson(Reciter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'letter': instance.letter,
      'moshaf': instance.moshaf.map((e) => e.toJson()).toList(),
    };

Moshaf _$MoshafFromJson(Map<String, dynamic> json) => Moshaf(
      id: json['id'] as int?,
      name: json['name'] as String?,
      server: json['server'] as String?,
      surahTotal: json['surahTotal'] as int?,
      moshafType: json['moshafType'] as int?,
      surahList: json['surahList'] as String?,
    );

Map<String, dynamic> _$MoshafToJson(Moshaf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'surahTotal': instance.surahTotal,
      'moshafType': instance.moshafType,
      'surahList': instance.surahList,
    };
