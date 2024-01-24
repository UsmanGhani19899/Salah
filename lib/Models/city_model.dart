import 'package:json_annotation/json_annotation.dart';
part 'city_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CityModel {
  int? totalResultsCount;
  List<Geoname>? geonames;

  CityModel({
    required this.totalResultsCount,
    required this.geonames,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return _$CityModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CityModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Geoname {
  String? adminCode1;
  String? lng;
  int? geonameId;
  String? toponymName;
  String? countryId;

  int population;

  String? name;
  AdminCodes1? adminCodes1;
  String? adminName1;
  String? lat;

  Geoname({
    required this.adminCode1,
    required this.lng,
    required this.geonameId,
    required this.toponymName,
    required this.countryId,
    // required this.fcl,
    required this.population,
    // required this.countryCode,
    required this.name,
    // required this.fclName,
    required this.adminCodes1,
    // required this.countryName,
    // required this.fcodeName,
    required this.adminName1,
    required this.lat,
    // required this.fcode,
  });
  factory Geoname.fromJson(Map<String, dynamic> json) {
    return _$GeonameFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GeonameToJson(this);
  }
}

@JsonSerializable()
class AdminCodes1 {
  String? iso31662;

  AdminCodes1({
    required this.iso31662,
  });
  factory AdminCodes1.fromJson(Map<String, dynamic> json) {
    return _$AdminCodes1FromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$AdminCodes1ToJson(this);
  }
}

// enum CountryCode { PK }

// enum CountryName { PAKISTAN }

// enum Fcl { P }

// enum FclName { CITY_VILLAGE }

// enum Fcode { PPLA, PPLA2, PPLC }

// enum FcodeName {
//   CAPITAL_OF_A_POLITICAL_ENTITY,
//   SEAT_OF_A_FIRST_ORDER_ADMINISTRATIVE_DIVISION,
//   SEAT_OF_A_SECOND_ORDER_ADMINISTRATIVE_DIVISION
// }
