import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:twid/constants/constants.dart';
import 'package:twid/main_navigator_page2/services/places_info.dart';

import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import 'package:geolocator/geolocator.dart' as geo;
import '../main_navigator_page/main_navigator_page_widget.dart';
import '../main_navigator_page_place_info/main_navigator_page_place_info_widget.dart';
import '../place_information_point/place_information_point_widget.dart';
import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainNavigatorPage2Widget extends StatefulWidget {
  const MainNavigatorPage2Widget({Key? key}) : super(key: key);

  @override
  _MainNavigatorPage2WidgetState createState() =>
      _MainNavigatorPage2WidgetState();
}

double? distance;

class _MainNavigatorPage2WidgetState extends State<MainNavigatorPage2Widget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const Map<String, dynamic> sourcePosition = {
    "LatLng": LatLng(37.4082654, -122.0776239),
    "place_id": "ChIJRZwK9lG3j4ARu7XnITpafSY"
  };
  static const List<Map<String, dynamic>> destination = [
    {
      "LatLng": LatLng(37.4144292, -122.0811554),
      "place_id": "ChIJOYvCo1W3j4AR1LAifgk13rs"
    }
  ];
  LocationData? currentLocation;
  StreamSubscription? _locationSubscription;

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();
      location.getLocation().then(
        (location) {
          currentLocation = location;
          setState(() {});
        },
      );

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }
      _locationSubscription = location.onLocationChanged.listen((newLoc) async {
        currentLocation = newLoc;

        googleMapController.moveCamera(CameraUpdate.newLatLng(
            LatLng(newLoc.latitude!, newLoc.longitude!)));
        setState(() {});
      });
    } on PlatformException catch (e) {
      if (e.code == "PERMISSION_DENIED") {
        debugPrint("Permission Denied");
      }
    }
  }

  List<LatLng> polylineCoordinatesMap = [];

  Future<void> getPolyPoint() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(37.4221, -122.0841),
      PointLatLng(37.4116, -122.0713),
    );

    if (polylineResult.points.isNotEmpty) {
      polylineResult.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        polylineCoordinatesMap = polylineCoordinates;
      });
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    GoogleMapController googleMapController;
    getCurrentLocation();
    getPolyPoint();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    _locationSubscription!.cancel();
    _unfocusNode.dispose();
    super.dispose();
  }

  Future refresh() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentLocation == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }
    double totalDistance = 0;
    totalDistance += calculateDistance(
        currentLocation!.latitude,
        currentLocation!.longitude,
        destination[0]["LatLng"].latitude,
        destination[0]["LatLng"].longitude);
    setState(() {
      distance = totalDistance;
      print("DISTNACE: " + distance.toString());
    });
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: false,
                polylines: {
                  Polyline(
                      polylineId: PolylineId('route'),
                      points: polylineCoordinatesMap,
                      color: Colors.black,
                      width: 6)
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 13.5),
                markers: {
                  Marker(
                      infoWindow: InfoWindow(title: 'its me'),
                      markerId: MarkerId('currentLocation'),
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!)),
                  // Marker(
                  //     markerId: MarkerId('source'), position: sourcePosition),
                  Marker(
                      markerId: MarkerId('destination'),
                      position: destination[0]["LatLng"]),
                },
                onMapCreated: (mapContoller) {
                  // final GoogleMapController googleMapController =
                  //     await _controller.future;
                  // _controller.complete(mapContoller);
                  googleMapController = mapContoller;
                },
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0x00002532),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (distance! < 0.3)
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              var res = await PlacesInfo.getPlace(
                                  destination[0]["place_id"]);
                              // print(res);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PlaceInformationPointWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 61,
                              decoration: BoxDecoration(
                                color: Color(0x00D9DCDE),
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/new_point2.png',
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x00D9DCDE),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: 16,
                              borderWidth: 0.5,
                              buttonSize: 48,
                              fillColor: Color(0x00BE7C71),
                              icon: Icon(
                                FFIcons.karrowBack,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: MainNavigatorPageWidget(),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PlaceInformationPointWidget(),
                                      ),
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'bf5ij9cc' /* POINT INFORMATION */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48,
                                    color: Color(0x00F4472B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: 16,
                              borderWidth: 0.5,
                              buttonSize: 48,
                              fillColor: Color(0x00BE7C71),
                              icon: Icon(
                                FFIcons.karrowForward,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: MainNavigatorPagePlaceInfoWidget(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0x00D9DCDE),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Color(0x00F4472B),
                              borderRadius: 16,
                              borderWidth: 0,
                              buttonSize: 48,
                              fillColor: Color(0x00BE7C71),
                              icon: Icon(
                                FFIcons.kquestion,
                                color: FlutterFlowTheme.of(context).lineColor,
                                size: 24,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: HelpWidget(),
                                  ),
                                );
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Color(0x00F4472B),
                              borderRadius: 16,
                              buttonSize: 48,
                              fillColor: Color(0x00BE7C71),
                              icon: Icon(
                                FFIcons.ksettings,
                                color: FlutterFlowTheme.of(context).lineColor,
                                size: 24,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: SettingsWidget(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
