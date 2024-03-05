// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukhari_hadis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukhariHadithModel _$WelcomeFromJson(Map<String, dynamic> json) => BukhariHadithModel(
      id: json['id'] as int,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      hadiths: (json['hadiths'] as List<dynamic>?)
          ?.map((e) => Hadith.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WelcomeToJson(BukhariHadithModel instance) => <String, dynamic>{
      'id': instance.id,
      'metadata': instance.metadata!.toJson(),
      'chapters': instance.chapters?.map((e) => e.toJson()).toList(),
      'hadiths': instance.hadiths?.map((e) => e.toJson()).toList(),
    };

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int,
      bookId: json['bookId'] as int,
      arabic: json['arabic'] as String?,
      english: json['english'] as String?,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'bookId': instance.bookId,
      'arabic': instance.arabic,
      'english': instance.english,
    };

Hadith _$HadithFromJson(Map<String, dynamic> json) => Hadith(
      id: json['id'] as int,
      arabic: json['arabic'] as String?,
      english: json['english'] == null
          ? null
          : English.fromJson(json['english'] as Map<String, dynamic>),
      chapterId: json['chapterId'] as int,
      bookId: json['bookId'] as int,
      idInBook: json['idInBook'] as int,
    );

Map<String, dynamic> _$HadithToJson(Hadith instance) => <String, dynamic>{
      'id': instance.id,
      'arabic': instance.arabic,
      'english': instance.english?.toJson(),
      'chapterId': instance.chapterId,
      'bookId': instance.bookId,
      'idInBook': instance.idInBook,
    };

English _$EnglishFromJson(Map<String, dynamic> json) => English(
      narrator: json['narrator'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$EnglishToJson(English instance) => <String, dynamic>{
      'narrator': instance.narrator,
      'text': instance.text,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      id: json['id'] as int,
      length: json['length'] as int,
      arabic: Arabic.fromJson(json['arabic'] as Map<String, dynamic>),
      english: Arabic.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'id': instance.id,
      'length': instance.length,
      'arabic': instance.arabic!.toJson(),
      'english': instance.english!.toJson(),
    };

Arabic _$ArabicFromJson(Map<String, dynamic> json) => Arabic(
      title: json['title'] as String?,
      author: json['author'] as String?,
      introduction: json['introduction'] as String?,
    );

Map<String, dynamic> _$ArabicToJson(Arabic instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'introduction': instance.introduction,
    };
