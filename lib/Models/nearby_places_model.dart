import 'package:json_annotation/json_annotation.dart';
part 'nearby_places_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NearbyPlaces {
  List<String>? htmlAttributions;
  List<Result>? results;
  String? status;

  NearbyPlaces({
    required this.htmlAttributions,
    required this.results,
    required this.status,
  });
  factory NearbyPlaces.fromJson(Map<String, dynamic> json) {
    return _$NearbyPlacesFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NearbyPlacesToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Result {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  PlusCode? plusCode;
  double? rating;
  String? reference;
  String? scope;
  // List<Type>? types;
  int? userRatingsTotal;
  String? vicinity;

  Result({
    required this.businessStatus,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    this.openingHours,
    this.photos,
    required this.placeId,
    required this.plusCode,
    required this.rating,
    required this.reference,
    required this.scope,
    // required this.types,
    required this.userRatingsTotal,
    required this.vicinity,
  });
  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ResultToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });
  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GeometryToJson(this);
  }
}

@JsonSerializable()
class Location {
  double? lat;
  double? lng;

  Location({
    required this.lat,
    required this.lng,
  });
  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });
  factory Viewport.fromJson(Map<String, dynamic> json) {
    return _$ViewportFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ViewportToJson(this);
  }
}

@JsonSerializable()
class OpeningHours {
  bool? openNow;

  OpeningHours({
    required this.openNow,
  });
  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return _$OpeningHoursFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$OpeningHoursToJson(this);
  }
}

@JsonSerializable()
class Photo {
  int height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });
  factory Photo.fromJson(Map<String, dynamic> json) {
    return _$PhotoFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PhotoToJson(this);
  }
}

@JsonSerializable()
class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });
  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return _$PlusCodeFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PlusCodeToJson(this);
  }
}

// enum Type { ESTABLISHMENT, MOSQUE, PLACE_OF_WORSHIP, POINT_OF_INTEREST }
