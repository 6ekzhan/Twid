import 'dart:async';
import 'dart:developer';
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

import '../trip_finish/trip_finish_widget.dart';

class MainNavigatorPage2Widget extends StatefulWidget {
  const MainNavigatorPage2Widget({Key? key}) : super(key: key);

  @override
  _MainNavigatorPage2WidgetState createState() =>
      _MainNavigatorPage2WidgetState();
}

double? distance;
Marker? marker;

class _MainNavigatorPage2WidgetState extends State<MainNavigatorPage2Widget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  LocationData? currentLocation;
  LocationData? startingPoint;
  StreamSubscription? _locationSubscription;

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;

  Marker? marker;
  late int counter;
  bool isStart = false;
  bool isLeaving = false;
  bool isEndPoint = false;
  double EndPointDistance = 0;

  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/currentDirection.png")
        .then((icon) => currentIcon = icon);
  }

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();
      currentLocation = await location.getLocation();

      setState(() {});
      print(currentLocation);

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

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void updateMarkers(int index) {
    markers[index].copyWith(visibleParam: false);

    setState(() {});
  }

  List<Marker> markers = [];

  loadMarker() {
    markers.add(
      Marker(
          markerId: MarkerId('source0'),
          position: LatLng(37.4156, -122.0782),
          visible: false),
    );
    markers.add(
      Marker(
        markerId: MarkerId(
          'source1',
        ),
        position: LatLng(37.4238, -122.0779),
        visible: false,
      ),
    );
    markers.add(
      Marker(
          markerId: MarkerId('source2'),
          position: LatLng(37.4279, -122.0779),
          visible: false),
    );
    setState(() {});
  }

  void getDistance() {
    double totalDistance = 0;
    if (currentLocation != null)
      totalDistance += calculateDistance(
          currentLocation!.latitude,
          currentLocation!.longitude,
          markers[counter].position.latitude,
          markers[counter].position.longitude);
    setState(() {
      if (distance != null && distance! <= 0.2) {
        if (counter == markers.length - 1) {
          isEndPoint = true;
        }
        if (distance! <= 0.1) {
          isLeaving = true;
        }
      }
      if (isLeaving == true) {
        if (distance! > 0.2) {
          isLeaving = !isLeaving;
          if (isEndPoint == false) {
            counter++;
          }
        }
      }

      distance = totalDistance;
      print("DISTNACE: " + distance.toString());
      print("Counter " + counter.toString());
      print("IsLeaving " + isLeaving.toString());
      print("Endpoint " + isEndPoint.toString());
      print("MARKER LENGTH" + markers.length.toString());
    });
  }

  @override
  void initState() {
    counter = 0;
    loadMarker();
    setCustomMarkerIcon();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    _locationSubscription!.cancel();

    _unfocusNode.dispose();
    super.dispose();
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

    getDistance();
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
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 13.5),
                markers: {
                  Marker(
                      markerId: MarkerId("currentLocation"),
                      infoWindow: InfoWindow(title: "Its me"),
                      rotation: currentLocation!.heading!,
                      icon: currentIcon,
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!)),
                  for (int i = 0; i < Set<Marker>.of(markers).length; i++)
                    Set<Marker>.of(markers).elementAt(i),
                  for (int i = 0; i < Set<Marker>.of(markers).length; i++)
                    Set<Marker>.of(markers).elementAt(i).copyWith(
                        visibleParam: isStart == true ? counter == i : false),
                },
                onMapCreated: (mapContoller) {
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
                    if (isStart == false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            isStart = true;

                            startingPoint = currentLocation;
                          },
                          text: FFLocalizations.of(context).getText(
                            'gnh6m1of' /* LET'S GO! */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Metal',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    if (isEndPoint == false)
                      if (isStart == true)
                        if (isEndPoint == true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TripFinishWidget(),
                                  ),
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'lm18fn7u' /* FINISH */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 20),
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Metal',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                    ///distance
                    if (isStart == true)
                      if (distance != null &&
                          distance! < 0.2 &&
                          isEndPoint == false)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                print("MY HOMEEEEEEEEEE NUMBER " +
                                    counter.toString());
                                var res = await PlacesInfo.getPlacesId(
                                  markers[counter].position,
                                );
                                print(res);
                                var basePosition = await PlacesInfo.getPlacesId(
                                    LatLng(startingPoint!.latitude!,
                                        startingPoint!.longitude!));
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PlaceInformationPointWidget(
                                      markerCounter: counter,
                                      markers: markers,
                                      markerId: res,
                                      placesId: basePosition,
                                    ),
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
                                    if (isStart == true) {
                                      var res = await PlacesInfo.getPlacesId(
                                          LatLng(startingPoint!.latitude!,
                                              startingPoint!.longitude!));
                                      print(res);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlaceInformationPointWidget(
                                            markers: markers,
                                            placesId: res,
                                          ),
                                        ),
                                      );
                                    }
                                    var res = await PlacesInfo.getPlacesId(
                                        LatLng(currentLocation!.latitude!,
                                            currentLocation!.longitude!));
                                    print(res);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PlaceInformationPointWidget(
                                          markers: markers,
                                          placesId: res,
                                        ),
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
