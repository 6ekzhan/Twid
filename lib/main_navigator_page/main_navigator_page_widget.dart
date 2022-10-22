import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../main_navigator_page2/main_navigator_page2_widget.dart';
import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainNavigatorPageWidget extends StatefulWidget {
  const MainNavigatorPageWidget({Key? key}) : super(key: key);

  @override
  _MainNavigatorPageWidgetState createState() =>
      _MainNavigatorPageWidgetState();
}

class _MainNavigatorPageWidgetState extends State<MainNavigatorPageWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  static const LatLng point1 = LatLng(48.1960460033408, 11.607421486506787);
  static const LatLng point2 = LatLng(47.56867652108661, 11.094308671164406);
  static const LatLng point3 = LatLng(47.4769808306507, 10.814903121400691);
  static const LatLng point4 = LatLng(47.48022645642057, 10.735503171749787);
  static const LatLng point5 = LatLng(47.52539632776253, 10.843661080964308);
  String google_api_key_dest = "AIzaSyD8Ov_6USFLhH2V0cZwwIXTvirekBgCJy8";
  List<LatLng> polyCoords = [];

  void getPolyPoints() async {
    PolylinePoints polyPoints = PolylinePoints();

    PolylineResult result12 = await polyPoints.getRouteBetweenCoordinates(
      google_api_key_dest,
      PointLatLng(point1.latitude, point1.longitude),
      PointLatLng(point2.latitude, point2.longitude),
    );
    PolylineResult result23 = await polyPoints.getRouteBetweenCoordinates(
      google_api_key_dest,
      PointLatLng(point2.latitude, point2.longitude),
      PointLatLng(point3.latitude, point3.longitude),
    );
    PolylineResult result34 = await polyPoints.getRouteBetweenCoordinates(
      google_api_key_dest,
      PointLatLng(point3.latitude, point3.longitude),
      PointLatLng(point4.latitude, point4.longitude),
    );
    PolylineResult result45 = await polyPoints.getRouteBetweenCoordinates(
      google_api_key_dest,
      PointLatLng(point4.latitude, point4.longitude),
      PointLatLng(point5.latitude, point5.longitude),
    );

    if (result12.points.isNotEmpty) {
      result12.points.forEach(
        (PointLatLng point) => polyCoords.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      result23.points.forEach(
        (PointLatLng point) => polyCoords.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      result34.points.forEach(
        (PointLatLng point) => polyCoords.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      result45.points.forEach(
        (PointLatLng point) => polyCoords.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: point1, zoom: 12.5),
          polylines: {
            Polyline(
                polylineId: PolylineId("route"),
                points: polyCoords,
                color: Colors.blue,
                width: 3),
          },
          markers: {
            Marker(
                markerId: MarkerId("point1"),
                position: point1,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet)),
            const Marker(markerId: MarkerId("point2"), position: point2),
            Marker(markerId: MarkerId("point3"), position: point3),
            Marker(markerId: MarkerId("point4"), position: point4),
            Marker(markerId: MarkerId("point5"), position: point5),
          },
        ),
      ),
    );
  }
}
