import 'package:json_annotation/json_annotation.dart';
part 'bukhari_hadis_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BukhariHadithModel {
    int? id;
    Metadata? metadata;
    List<Chapter>? chapters;
    List<Hadith>? hadiths;

    BukhariHadithModel({
        required this.id,
        required this.metadata,
        required this.chapters,
        required this.hadiths,
    });
 factory BukhariHadithModel.fromJson(Map<String, dynamic> json) {
    return _$WelcomeFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$WelcomeToJson(this);
  }
}
@JsonSerializable( )
class Chapter {
    int? id;
    int? bookId;
    String? arabic;
    String? english;

    Chapter({
        required this.id,
        required this.bookId,
        required this.arabic,
        required this.english,
    });
 factory Chapter.fromJson(Map<String, dynamic> json) {
    return _$ChapterFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ChapterToJson(this);
  }
}
@JsonSerializable(explicitToJson: true)
class Hadith {
    int id;
    String? arabic;
    English? english;
    int? chapterId;
    int? bookId;
    int? idInBook;

    Hadith({
        required this.id,
        required this.arabic,
        required this.english,
        required this.chapterId,
        required this.bookId,
        required this.idInBook,
    });
 factory Hadith.fromJson(Map<String, dynamic> json) {
    return _$HadithFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$HadithToJson(this);
  }
}
@JsonSerializable( )
class English {
    String? narrator;
    String? text;

    English({
        required this.narrator,
        required this.text,
    });
 factory English.fromJson(Map<String, dynamic> json) {
    return _$EnglishFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$EnglishToJson(this);
  }
}
@JsonSerializable(explicitToJson: true)
class Metadata {
    int? id;
    int? length;
    Arabic? arabic;
    Arabic? english;

    Metadata({
        required this.id,
        required this.length,
        required this.arabic,
        required this.english,
    });
 factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}
@JsonSerializable( )
class Arabic {
    String? title;
    String? author;
    String? introduction;

    Arabic({
        required this.title,
        required this.author,
        required this.introduction,
    });
 factory Arabic.fromJson(Map<String, dynamic> json) {
    return _$ArabicFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ArabicToJson(this);
  }
}
