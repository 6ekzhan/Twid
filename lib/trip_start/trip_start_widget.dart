import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../main_navigator_page/main_navigator222.dart';
import '../main_navigator_page/main_navigator_page_widget.dart';
import '../settings/settings_widget.dart';
import '../takea_car/takea_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:ui' as ui;

class TripStartWidget extends StatefulWidget {
  const TripStartWidget({Key? key}) : super(key: key);

  @override
  _TripStartWidgetState createState() => _TripStartWidgetState();
}

class _TripStartWidgetState extends State<TripStartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  BitmapDescriptor? iconn;

  loadData() async {
    markIcons = await getImages(images[0], 80);
    iconn = BitmapDescriptor.fromBytes(markIcons!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 308, 16, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                    50.96945060011596,
                                    71.358997664587,
                                    0,
                                    iconn!),
                              ),
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '3c87wq81' /* НАЧАТЬ ПУТЕШЕСТВИЕ */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 112,
                            color: Color(0x00F4472B),
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Metal',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 24,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                  lineHeight: 2,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 278, 0, 24),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakeaCarWidget(),
                              ),
                            );
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'adl2jnc3' /* Как забрать машину */,
                            ),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                    ),
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
      ),
    );
  }
}
