import '../about_place/about_place_widget.dart';
import '../backend/backend.dart';
import '../calendar/calendar_widget.dart';
import '../car/car_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../help/help_widget.dart';
import '../instructions010/instructions010_widget.dart';
import '../settings/settings_widget.dart';
import '../takea_car/takea_car_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Trip1Widget extends StatefulWidget {
  const Trip1Widget({Key? key}) : super(key: key);

  @override
  _Trip1WidgetState createState() => _Trip1WidgetState();
}

class _Trip1WidgetState extends State<Trip1Widget> {
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 52),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7b7tfv87' /* Your journey started through: */,
                            ),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Instructions010Widget(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 0.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                width: double.infinity,
                                height: 96,
                                child: custom_widgets.CustomTimer(
                                  width: double.infinity,
                                  height: 96,
                                  color: Color(0xFF002532),
                                  date: FFAppState().aa!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 28, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kcar,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CarWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'hy6dw4ym' /* Porsche 911 Carrera GTS */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CalendarWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kcalendar,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CalendarWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'wzbafwa9' /* October 10 — October 12, 2022 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 50, 0, 0),
                        child: SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            '7ho7tok1' /* Cabo da Roca — Nazare. Portuga... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Metal',
                                    color: Color(0xFFF4472B),
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kmap,
                              color: Color(0xFFD9DCDE),
                              size: 24,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AboutPlaceWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'u8lwwu0t' /* More journey details */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFD9DCDE),
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: StreamBuilder<List<TourRecord>>(
                          stream: queryTourRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<TourRecord> rowTourRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final rowTourRecord = rowTourRecordList.isNotEmpty
                                ? rowTourRecordList.first
                                : null;
                            return Builder(
                              builder: (context) {
                                final images1 =
                                    rowTourRecord!.images1!.toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(images1.length,
                                        (images1Index) {
                                      final images1Item = images1[images1Index];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            'https://picsum.photos/seed/692/600',
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
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 36),
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
                              'ocefep6i' /* How to pick up the car? */,
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
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
