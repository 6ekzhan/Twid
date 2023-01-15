import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twid/constants/constants.dart';
import 'package:twid/main_navigator_page2/services/places_info.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../place_information/place_information_widget.dart';
import '../settings/settings_widget.dart';

class PlaceInformationPointWidget extends StatefulWidget {
  List<String> placesId;

  PlaceInformationPointWidget({
    Key? key,
    required this.placesId,
  }) : super(key: key);
  @override
  _PlaceInformationPointWidgetState createState() =>
      _PlaceInformationPointWidgetState();
}

class _PlaceInformationPointWidgetState
    extends State<PlaceInformationPointWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 87, 0, 0),
          child: FutureBuilder(
              future: PlacesInfo.getPlaces(widget.placesId),
              builder: ((BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '2uxvi0iv' /* POINT 2 (OF 6) */,
                              ),
                              style: TextStyle(
                                fontFamily: 'SF Compact',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'r20f6faw' /* NEW POINT */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Metal',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'yn1gzi9t' /* PORTUGAL */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 16, 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          snapshot.data![index]["name"],
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Metal',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 25,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          (snapshot.data![index]
                                                      ["editorial_summary"] !=
                                                  null
                                              ? snapshot.data![index]
                                                      ["editorial_summary"]
                                                  ["overview"]
                                              : "Description of this place is not provided"),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            // final image1 = FFAppState().Image.toList();
                                            final images =
                                                snapshot.data![index]["photos"];
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    List.generate(images.length,
                                                        (imageIndex) {
                                                  final imageItem =
                                                      images[imageIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 4, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=${imageItem["photo_reference"]}&key=$google_api_key',
                                                        width: 316,
                                                        height: 218,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 8),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'mt3k8scy' /* Listen audio */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Color(0xFFC8C8C8),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                      //   child: Container(
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(16),
                      //     ),
                      //     child: Column(
                      //       mainAxisSize: MainAxisSize.max,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Padding(
                      //           padding:
                      //               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      //           child: Text(
                      //             FFLocalizations.of(context).getText(
                      //               'fx5ab5ue' /* OCEANARIUM */,
                      //             ),
                      //             style: FlutterFlowTheme.of(context)
                      //                 .title1
                      //                 .override(
                      //                   fontFamily: 'Metal',
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .primaryColor,
                      //                   fontSize: 25,
                      //                   fontWeight: FontWeight.normal,
                      //                   useGoogleFonts: false,
                      //                 ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding:
                      //               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      //           child: Text(
                      //             FFLocalizations.of(context).getText(
                      //               'kgw33dh9' /* Pariatur reprehenderit asperio... */,
                      //             ),
                      //             style: FlutterFlowTheme.of(context)
                      //                 .bodyText1
                      //                 .override(
                      //                   fontFamily: 'Inter',
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .tertiaryColor,
                      //                   fontWeight: FontWeight.normal,
                      //                 ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding:
                      //               EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      //           child: Builder(
                      //             builder: (context) {
                      //               final image2 = FFAppState().Image.toList();
                      //               return SingleChildScrollView(
                      //                 scrollDirection: Axis.horizontal,
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   children: List.generate(image2.length,
                      //                       (image2Index) {
                      //                     final image2Item = image2[image2Index];
                      //                     return Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               4, 0, 4, 0),
                      //                       child: ClipRRect(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                         child: Image.network(
                      //                           'https://picsum.photos/seed/692/600',
                      //                           width: 316,
                      //                           height: 218,
                      //                           fit: BoxFit.fill,
                      //                         ),
                      //                       ),
                      //                     );
                      //                   }),
                      //                 ),
                      //               );
                      //             },
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding:
                      //               EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      //           child: Text(
                      //             FFLocalizations.of(context).getText(
                      //               'dqpkzpnq' /* Listen audio */,
                      //             ),
                      //             style: FlutterFlowTheme.of(context)
                      //                 .bodyText1
                      //                 .override(
                      //                   fontFamily: 'Inter',
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .primaryColor,
                      //                   fontWeight: FontWeight.bold,
                      //                   decoration: TextDecoration.underline,
                      //                 ),
                      //           ),
                      //         ),
                      //         Divider(
                      //           thickness: 1,
                      //           color: Color(0xFFC8C8C8),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: 16,
                                      borderWidth: 0.5,
                                      buttonSize: 48,
                                      fillColor: Color(0x00BE7C71),
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowLeft,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
                                            child: PlaceInformationWidget(),
                                          ),
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ewex2sak' /* BACK TO NAVIGATOR */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            color: Color(0x00F4472B),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: 16,
                                      borderWidth: 0.5,
                                      buttonSize: 48,
                                      fillColor: Color(0x00BE7C71),
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
                                            child: PlaceInformationPointWidget(
                                              placesId: ["ss"],
                                            ),
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Color(0x00F4472B),
                                      borderRadius: 16,
                                      borderWidth: 0,
                                      buttonSize: 48,
                                      fillColor: Color(0x00BE7C71),
                                      icon: Icon(
                                        FFIcons.kquestion,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
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
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                            reverseDuration:
                                                Duration(milliseconds: 0),
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
                  );
                }
              })),
        ),
      ),
    );
  }
}
