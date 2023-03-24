// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:twid/language/language_widget.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:math' show cos, sqrt, asin;

import 'dart:ui' as ui;

class NavigationScreen extends StatefulWidget {
  double lat;
  double lng;
  final int ii;
  final map.BitmapDescriptor iconn2;
  NavigationScreen(this.lat, this.lng, this.ii, this.iconn2);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  String google_api_key_dest = "AIzaSyD8Ov_6USFLhH2V0cZwwIXTvirekBgCJy8";
  final Completer<map.GoogleMapController?> _controller = Completer();
  Map<map.PolylineId, map.Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Location location = Location();
  map.Marker? sourcePosition, destinationPosition, testMarker;
  loc.LocationData? _currentPosition;
  map.LatLng curLocation = map.LatLng(51.091249211700934, 71.38939386600918);
  StreamSubscription<loc.LocationData>? locationSubscription;

  List<String> images = ['assets/images/marker222.png'];
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Uint8List? markIcons;
  map.BitmapDescriptor? iconn;

  loadData() async {
    markIcons = await getImages(images[0], 40);
    iconn = map.BitmapDescriptor.fromBytes(markIcons!);
  }

  // Using keys property and firstWhere() method
  // to get key in a map

  Map<int, map.LatLng> latMap = {
    0: map.LatLng(48.19687999873028, 11.607928309337511),
    1: map.LatLng(47.56854839092646, 11.094272455999523),
    2: map.LatLng(47.4769736, 10.8148991),
    3: map.LatLng(47.4802262, 10.7355182),
    4: map.LatLng(47.5253892, 10.8436864),
    5: map.LatLng(47.6901119, 12.8017926),
  };
  map.LatLng? first;
  double? lat1;
  double? lon1;

  map.LatLng? previous;
  double? lat2;
  double? lon2;
  void getCurrentLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition();

    setState(() {
      curLocation = map.LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    loadData();
    getCurrentLocation();
    // TODO: implement initState
    super.initState();

    getNavigation();
    first = latMap[widget.ii];
    lat1 = first?.latitude ?? 51.16095654443546;
    lon1 = first?.longitude ?? 71.4725400808953;

    widget.lat = lat1 ?? 50.96945060011596;
    widget.lng = lon1 ?? 71.358997664587; //50.96945060011596, 71.358997664587,

    if (widget.ii >= 1) {
      previous = latMap[widget.ii - 1];
      lat2 = previous?.latitude ?? 51.16095654443546;
      lon2 = previous?.longitude ?? 71.4725400808953;
    }

    print(first);
    addMarker();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sourcePosition == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                map.GoogleMap(
                  zoomControlsEnabled: false,
                  polylines: Set<map.Polyline>.of(polylines.values),
                  initialCameraPosition: map.CameraPosition(
                    target: curLocation,
                    zoom: 12,
                  ),
                  markers: {testMarker!, destinationPosition!},
                  onTap: (latLng) {
                    print(latLng);
                  },
                  onMapCreated: (map.GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Positioned(
                  top: 50,
                  left: 35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LanguageWidget()),
                          (route) => false);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 120,
                    right: 110,
                    left: 110,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        elevation: 5,
                        color: Colors.redAccent,
                        onPressed: () async {
                          if (widget.ii <= 3 && widget.ii >= 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationScreen(
                                        lat2!,
                                        lon2!,
                                        widget.ii - 1,
                                        widget.iconn2)));
                          } else if (widget.ii == 0) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('This is the first route'),
                                  content: Text('There is no previous route'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('This is the first route'),
                                  content: Text('There is no previous route'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          "Previous route",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ))),
                Positioned(
                    bottom: 50,
                    right: 130,
                    left: 130,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        elevation: 5,
                        color: Colors.redAccent,
                        onPressed: () async {
                          if (widget.ii < 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationScreen(
                                        lat1!,
                                        lon1!,
                                        widget.ii + 1,
                                        widget.iconn2)));
                          } else if (widget.ii == 3) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('No Further routes'),
                                  content: Text('OK'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          "Next route",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ))),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.navigation_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await launchUrl(Uri.parse(
                                'google.navigation:q=${widget.lat}, ${widget.lng}&key=$google_api_key_dest'));
                          },
                        ),
                      ),
                    ))
              ],
            ),
    );
  }

  getNavigation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    final map.GoogleMapController? controller = await _controller.future;
    location.changeSettings(accuracy: loc.LocationAccuracy.high);
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (_permissionGranted == loc.PermissionStatus.granted) {
      _currentPosition = await location.getLocation();
      curLocation =
          map.LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
      locationSubscription =
          location.onLocationChanged.listen((LocationData currentLocation) {
        controller?.animateCamera(
            map.CameraUpdate.newCameraPosition(map.CameraPosition(
          target:
              map.LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 16,
        )));
        if (mounted) {
          controller?.showMarkerInfoWindow(
              map.MarkerId(sourcePosition!.markerId.value));
          setState(() {
            curLocation = map.LatLng(
                currentLocation.latitude!, currentLocation.longitude!);
            sourcePosition = map.Marker(
              markerId: map.MarkerId(currentLocation.toString()),
              icon: map.BitmapDescriptor.defaultMarkerWithHue(
                  map.BitmapDescriptor.hueBlue),
              position: map.LatLng(
                  currentLocation.latitude!, currentLocation.longitude!),
              infoWindow: map.InfoWindow(
                  title:
                      '${double.parse((getDistance(map.LatLng(widget.lat, widget.lng)).toStringAsFixed(2)))} km'),
              onTap: () {
                print('market tapped');
              },
            );
          });
          getDirections(map.LatLng(widget.lat, widget.lng));
        }
      });
    }
  }

  getDirections(map.LatLng dst) async {
    List<map.LatLng> polylineCoordinates = [];
    List<dynamic> points = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        '$google_api_key_dest',
        PointLatLng(curLocation.latitude, curLocation.longitude),
        PointLatLng(dst.latitude, dst.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(map.LatLng(point.latitude, point.longitude));
        points.add({'lat': point.latitude, 'lng': point.longitude});
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<map.LatLng> polylineCoordinates) {
    map.PolylineId id = map.PolylineId('poly');
    map.Polyline polyline = map.Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  double getDistance(map.LatLng destposition) {
    return calculateDistance(curLocation.latitude, curLocation.longitude,
        destposition.latitude, destposition.longitude);
  }

  addMarker() async {
    setState(() {
      sourcePosition = map.Marker(
        markerId: map.MarkerId('source'),
        position: curLocation,
        icon: map.BitmapDescriptor.defaultMarkerWithHue(
            map.BitmapDescriptor.hueYellow),
      );
      testMarker = map.Marker(
        markerId: map.MarkerId('test'),
        position: map.LatLng(curLocation.latitude, curLocation.longitude),
        icon: widget.iconn2,
      );
      destinationPosition = map.Marker(
        markerId: map.MarkerId('destination'),
        position: map.LatLng(widget.lat, widget.lng),
        icon: map.BitmapDescriptor.defaultMarkerWithHue(
            map.BitmapDescriptor.hueYellow),
      );
    });
  }
}
