import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salah/Core/get_constants.dart';

class SalahMap extends StatefulWidget {
  final double lat;
  final double lnng;
  const SalahMap({super.key, required this.lat, required this.lnng});

  @override
  State<SalahMap> createState() => Salah_MapState();
}

String? _mapStyle;
Completer<GoogleMapController> _controller = Completer();
Map<MarkerId, Marker> _markersId = <MarkerId, Marker>{};

late GoogleMapController _mapController;
Constant constant = Constant();
Marker demo = new Marker(
  markerId: MarkerId("marker_id"),
  infoWindow: InfoWindow(title: '_currentAddress'),
);

class Salah_MapState extends State<SalahMap> {
  @override
  void initState() {
    rootBundle.loadString('assets/images/map_theme_night.txt').then((string) {
      _mapStyle = string;
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.lat == 0 && widget.lnng == 0
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                markers: {
                  Marker(
                    markerId: MarkerId('Sydney'),
                    position: LatLng(-33.923740, 150.920166),
                  )
                },
                // markers: [_markerId] = _marker,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                  _mapController.setMapStyle(_mapStyle);
                  // Perform any additional initialization here
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.lat, widget.lnng),
                  zoom: 15,
                ),
              ));
  }
}
