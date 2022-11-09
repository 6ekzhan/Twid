import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../main_navigator_page_place_info/main_navigator_page_place_info_widget.dart';
import '../place_information_point/place_information_point_widget.dart';
import '../settings/settings_widget.dart';
import '../trip_finish/trip_finish_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainNavigatorPageFinishWidget extends StatefulWidget {
  const MainNavigatorPageFinishWidget({Key? key}) : super(key: key);

  @override
  _MainNavigatorPageFinishWidgetState createState() =>
      _MainNavigatorPageFinishWidgetState();
}

class _MainNavigatorPageFinishWidgetState
    extends State<MainNavigatorPageFinishWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                child: FlutterFlowGoogleMap(
                  controller: googleMapsController,
                  onCameraIdle: (latLng) => googleMapsCenter = latLng,
                  initialLocation: googleMapsCenter ??=
                      currentUserLocationValue!,
                  markerColor: GoogleMarkerColor.violet,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.standard,
                  initialZoom: 14,
                  allowInteraction: true,
                  allowZoom: false,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: true,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
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
                        'lm18fn7u' /* ФИНИШ */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
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
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                                  'kiuoxc9a' /* ИНФОРМАЦИЯ О МЕСТЕ */,
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
            ],
          ),
        ),
      ),
    );
  }
}
