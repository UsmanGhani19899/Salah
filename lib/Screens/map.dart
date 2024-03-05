import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salah/Core/get_constants.dart';

class SalahMap extends StatefulWidget {
  // final polylines;
  final List<Marker>? marker;
  final double mosqueLat;
  final double mosqueLong;
  final double lat;
  final double lnng;
  const SalahMap(
      {super.key,
      // required this.polylines,
      required this.marker,
      required this.mosqueLat,
      required this.mosqueLong,
      required this.lat,
      required this.lnng});

  @override
  State<SalahMap> createState() => Salah_MapState();
}

String? _mapStyle;
Completer<GoogleMapController> _controller = Completer();
Map<MarkerId, Marker> _markersId = <MarkerId, Marker>{};

  // final Set<Polyline> _polyline = {};
  //  List<LatLng> latLen = [
  //   LatLng(19.0759837, 72.8776559),
  //   LatLng(28.679079, 77.069710),
  //   LatLng(26.850000, 80.949997),
  //   LatLng(24.879999, 74.629997),
  //   LatLng(16.166700, 74.833298),
  //   LatLng(12.971599, 77.594563),
  // ];
// List<Marker> markers = [
//   Marker(
//     markerId: MarkerId('marker1'),
//     position: LatLng(37.7749, -122.4194),
//     infoWindow: InfoWindow(title: 'Marker 1'),
//   ),
//   Marker(
//     markerId: MarkerId('marker2'),
//     position: LatLng(37.7749, -122.4294),
//     infoWindow: InfoWindow(title: 'Marker 2'),
//   ),
//   // Add more markers as needed
// ];

late GoogleMapController _mapController;
Constant constant = Constant();
Marker demo = new Marker(
  markerId: MarkerId("marker_id"),
  infoWindow: InfoWindow(title: '_currentAddress'),
);

class Salah_MapState extends State<SalahMap> {
  final Set<Polyline>_polyline={};
static   LatLng _center =   LatLng(33.738045, 73.084488);
//add your lat and lng where you wants to draw polyline
LatLng _lastMapPosition = _center;
// List<LatLng> latlng = List();
LatLng _new = LatLng(33.738045, 73.084488);
LatLng _news = LatLng(33.567997728, 72.635997456);

// latlng.add(_new);
// latlng.add(_news);
  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _mapController = controller;
    _mapController = controller;
    _mapController.setMapStyle(_mapStyle);
    var markerIdVal = _markersId.length + 1;
    String mar = markerIdVal.toString();
    final MarkerId markerId = MarkerId(mar);
    // final Marker marker = Marker(
    //     markerId: markerId,
    //     position: LatLng(widget.mosqueLat, widget.mosqueLong));

    // setState(() {
    //   _markersId[markers] = markers;
    // });
    // setState(() {
    //   _markersId[MarkerId('place_name')] = marker;
    // });
  }

  // void changeMapMode(GoogleMapController mapController) {
  //   getJsonFile("assets/map_style.json")
  //       .then((value) => setMapStyle(value, mapController));
  // }

  // //helper function
  // void setMapStyle(String mapStyle, GoogleMapController mapController) {
  //   mapController.setMapStyle(mapStyle);
  // }

  // //helper function
  // Future<String> getJsonFile(String path) async {
  //   ByteData byte = await rootBundle.load(path);
  //   var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
  //   return utf8.decode(list);
  // }

  @override
  void initState() {
    rootBundle.loadString('assets/images/map_theme_night.txt').then((string) {
      _mapStyle = string;
    });
          _polyline.add(Polyline(
            polylineId: PolylineId(_lastMapPosition.toString()),
            visible: true,
            //latlng is List<LatLng>
            points: [LatLng(33.738045, 73.084488)],
            color: Colors.blue,
        ));
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.lat == 0 && widget.lnng == 0
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff35c55e),
                ),
              )
            : GoogleMap(
              
              zoomControlsEnabled: false,
                buildingsEnabled: false,
                // polylines: widget.polylines,
                myLocationEnabled: true,
                compassEnabled: false,
                markers: Set<Marker>.of(widget.marker ?? []),
                polylines: _polyline,
                // markers: [_markerId] = _marker,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.lat, widget.lnng),
                  zoom: 13,
                ),
              ));
  }
}
