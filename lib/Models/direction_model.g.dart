// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooleMapDirectionModel _$GooleMapDirectionModelFromJson(
        Map<String, dynamic> json) =>
    GooleMapDirectionModel(
      geocodedWaypoints: (json['geocodedWaypoints'] as List<dynamic>?)
          ?.map((e) => GeocodedWaypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GooleMapDirectionModelToJson(
        GooleMapDirectionModel instance) =>
    <String, dynamic>{
      'geocodedWaypoints':
          instance.geocodedWaypoints?.map((e) => e.toJson()).toList(),
      'routes': instance.routes?.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

GeocodedWaypoint _$GeocodedWaypointFromJson(Map<String, dynamic> json) =>
    GeocodedWaypoint(
      geocoderStatus: json['geocoderStatus'] as String?,
      placeId: json['placeId'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GeocodedWaypointToJson(GeocodedWaypoint instance) =>
    <String, dynamic>{
      'geocoderStatus': instance.geocoderStatus,
      'placeId': instance.placeId,
      'types': instance.types,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      copyrights: json['copyrights'] as String?,
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewPolyline: json['overviewPolyline'] == null
          ? null
          : Polyline.fromJson(json['overviewPolyline'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      waypointOrder: json['waypointOrder'] as List<dynamic>?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'bounds': instance.bounds?.toJson(),
      'copyrights': instance.copyrights,
      'legs': instance.legs?.map((e) => e.toJson()).toList(),
      'overviewPolyline': instance.overviewPolyline?.toJson(),
      'summary': instance.summary,
      'warnings': instance.warnings,
      'waypointOrder': instance.waypointOrder,
    };

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
      northeast: json['northeast'] == null
          ? null
          : Northeast.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : Northeast.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast?.toJson(),
      'southwest': instance.southwest?.toJson(),
    };

Northeast _$NortheastFromJson(Map<String, dynamic> json) => Northeast(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NortheastToJson(Northeast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Leg _$LegFromJson(Map<String, dynamic> json) => Leg(
      distance: json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
      endAddress: json['endAddress'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Northeast.fromJson(json['endLocation'] as Map<String, dynamic>),
      startAddress: json['startAddress'] as String?,
      startLocation: json['startLocation'] == null
          ? null
          : Northeast.fromJson(json['startLocation'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      trafficSpeedEntry: json['trafficSpeedEntry'] as List<dynamic>?,
      viaWaypoint: json['viaWaypoint'] as List<dynamic>?,
    );

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'endAddress': instance.endAddress,
      'endLocation': instance.endLocation,
      'startAddress': instance.startAddress,
      'startLocation': instance.startLocation,
      'steps': instance.steps,
      'trafficSpeedEntry': instance.trafficSpeedEntry,
      'viaWaypoint': instance.viaWaypoint,
    };

Distance _$DistanceFromJson(Map<String, dynamic> json) => Distance(
      text: json['text'] as String?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$DistanceToJson(Distance instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      distance: json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
      endLocation: json['endLocation'] == null
          ? null
          : Northeast.fromJson(json['endLocation'] as Map<String, dynamic>),
      htmlInstructions: json['htmlInstructions'] as String?,
      polyline: json['polyline'] == null
          ? null
          : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : Northeast.fromJson(json['startLocation'] as Map<String, dynamic>),
      travelMode: json['travelMode'] as String?,
      maneuver: json['maneuver'] as String?,
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'distance': instance.distance?.toJson(),
      'duration': instance.duration?.toJson(),
      'endLocation': instance.endLocation?.toJson(),
      'htmlInstructions': instance.htmlInstructions,
      'polyline': instance.polyline?.toJson(),
      'startLocation': instance.startLocation?.toJson(),
      'travelMode': instance.travelMode,
      'maneuver': instance.maneuver,
    };

Polyline _$PolylineFromJson(Map<String, dynamic> json) => Polyline(
      points: json['points'] as String?,
    );

Map<String, dynamic> _$PolylineToJson(Polyline instance) => <String, dynamic>{
      'points': instance.points,
    };
