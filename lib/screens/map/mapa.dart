import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:alert_app/helpers/mapStyle.dart';


class HomeScreenMap extends StatefulWidget {
  @override
  _HomeScreenMapState createState() => _HomeScreenMapState();
}

class _HomeScreenMapState extends State<HomeScreenMap> {

  final CameraPosition _kGooglePlex = CameraPosition(
    // ignore: todo
    target: LatLng(-12.050103, -77.123895),//TODO: Position init
    zoom: 14.4746,
  );

  // GoogleMapController _googleMapController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller){
                controller.setMapStyle(jsonEncode(mapStyle));
                // _googleMapController = controller;
              },
              )
          ],
        ),
      ),
    );
  }
}