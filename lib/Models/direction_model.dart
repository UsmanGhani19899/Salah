import 'package:json_annotation/json_annotation.dart';
part 'direction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GooleMapDirectionModel {
  List<GeocodedWaypoint>? geocodedWaypoints;
  List<Route>? routes;
  String? status;

  GooleMapDirectionModel({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });
  factory GooleMapDirectionModel.fromJson(Map<String, dynamic> json) {
    return _$GooleMapDirectionModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GooleMapDirectionModelToJson(this);
  }
}

@JsonSerializable()
class GeocodedWaypoint {
  String? geocoderStatus;
  String? placeId;
  List<String>? types;

  GeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });
  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) {
    return _$GeocodedWaypointFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GeocodedWaypointToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Route {
  Bounds? bounds;
  String? copyrights;
  List<Leg>? legs;
  Polyline? overviewPolyline;
  String? summary;
  List<String>? warnings;
  List<dynamic>? waypointOrder;

  Route({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });
  factory Route.fromJson(Map<String, dynamic> json) {
    return _$RouteFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$RouteToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Bounds {
  Northeast? northeast;
  Northeast? southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });
  factory Bounds.fromJson(Map<String, dynamic> json) {
    return _$BoundsFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$BoundsToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Northeast {
  double? lat;
  double? lng;

  Northeast({
    required this.lat,
    required this.lng,
  });
  factory Northeast.fromJson(Map<String, dynamic> json) {
    return _$NortheastFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NortheastToJson(this);
  }
}

@JsonSerializable()
class Leg {
  Distance? distance;
  Distance? duration;
  String? endAddress;
  Northeast? endLocation;
  String? startAddress;
  Northeast? startLocation;
  List<Step>? steps;
  List<dynamic>? trafficSpeedEntry;
  List<dynamic>? viaWaypoint;

  Leg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });
  factory Leg.fromJson(Map<String, dynamic> json) {
    return _$LegFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LegToJson(this);
  }
}

@JsonSerializable()
class Distance {
  String? text;
  int? value;

  Distance({
    required this.text,
    required this.value,
  });
  factory Distance.fromJson(Map<String, dynamic> json) {
    return _$DistanceFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DistanceToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Step {
  Distance? distance;
  Distance? duration;
  Northeast? endLocation;
  String? htmlInstructions;
  Polyline? polyline;
  Northeast? startLocation;
  String? travelMode;
  String? maneuver;

  Step({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.polyline,
    required this.startLocation,
    required this.travelMode,
    this.maneuver,
  });
  factory Step.fromJson(Map<String, dynamic> json) {
    return _$StepFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$StepToJson(this);
  }
}

@JsonSerializable()
class Polyline {
  String? points;

  Polyline({
    required this.points,
  });
  factory Polyline.fromJson(Map<String, dynamic> json) {
    return _$PolylineFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PolylineToJson(this);
  }
}
