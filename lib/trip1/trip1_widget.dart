import '../about_place/about_place_widget.dart';
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 0, 0, (MediaQuery.of(context).size.height * 52) / 797),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 17) / 797,
                            (MediaQuery.of(context).size.width * 16) / 390,
                            0),
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width * 358) / 390,
                          height:
                              (MediaQuery.of(context).size.height * 44) / 797,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '7b7tfv87' /* Your journey started through: */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFD9DCDE),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      16) /
                                                  797 >
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      16) /
                                                  390
                                          ? (MediaQuery.of(context).size.width *
                                                  16) /
                                              390
                                          : (MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  16) /
                                              797,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            (MediaQuery.of(context).size.height * 20) / 797,
                            0,
                            0),
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
                            width:
                                (MediaQuery.of(context).size.width * 358) / 390,
                            height: (MediaQuery.of(context).size.height * 112) /
                                797,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) /
                                        390,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  (MediaQuery.of(context).size.width * 8) / 390,
                                  0,
                                  (MediaQuery.of(context).size.width * 8) / 390,
                                  0),
                              child: custom_widgets.CustomTimer(
                                width: double.infinity,
                                height:
                                    (MediaQuery.of(context).size.height * 96) /
                                        797,
                                color: Color(0xFF002532),
                                date: new DateTime(2023, 1, 20, 23, 0, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 28) / 797,
                            0,
                            0),
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
                                size: (MediaQuery.of(context).size.width * 24) /
                                    390,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 12) /
                                        390,
                                    0,
                                    0,
                                    0),
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
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      14) /
                                                  797 >
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      14) /
                                                  390
                                          ? (MediaQuery.of(context).size.width *
                                                  14) /
                                              390
                                          : (MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  14) /
                                              797,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dashed,
                                      decorationColor: Color(0xFFD9DCDE),
                                      decorationThickness:
                                          (MediaQuery.of(context).size.height *
                                                  0.5) /
                                              797,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797,
                            0,
                            0),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kcar,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: (MediaQuery.of(context).size.width * 24) /
                                    390,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 12) /
                                        390,
                                    0,
                                    0,
                                    0),
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
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                      fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      14) /
                                                  797 >
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      14) /
                                                  390
                                          ? (MediaQuery.of(context).size.width *
                                                  14) /
                                              390
                                          : (MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  14) /
                                              797,
                                      decorationStyle:
                                          TextDecorationStyle.dashed,
                                      decorationColor: Color(0xFFD9DCDE),
                                      decorationThickness:
                                          (MediaQuery.of(context).size.height *
                                                  0.5) /
                                              797,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 47) / 797,
                            0,
                            0),
                        child: SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            '7ho7tok1' /* Cabo da Roca — Nazare. Portuga... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Metal',
                                color: Color(0xFFF4472B),
                                fontSize: (MediaQuery.of(context).size.height *
                                                25) /
                                            797 >
                                        (MediaQuery.of(context).size.width *
                                                25) /
                                            390
                                    ? (MediaQuery.of(context).size.width * 25) /
                                        390
                                    : (MediaQuery.of(context).size.height *
                                            25) /
                                        797,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                useGoogleFonts: false,
                              ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797,
                            0,
                            0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kmap,
                              color: Color(0xFFD9DCDE),
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  (MediaQuery.of(context).size.width * 16) /
                                      390,
                                  0,
                                  0,
                                  0),
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
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize:
                                            (MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            14) /
                                                        797 >
                                                    (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            14) /
                                                        390
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        14) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        14) /
                                                    797,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            (MediaQuery.of(context).size.height * 35.59) / 797,
                            0,
                            0),
                        child: Builder(
                          builder: (context) {
                            final image = FFAppState().Image.toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(image.length, (imageIndex) {
                                  final imageItem = image[imageIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                4) /
                                            390,
                                        0,
                                        (MediaQuery.of(context).size.width *
                                                4) /
                                            390,
                                        0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://picsum.photos/seed/692/600',
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    316) /
                                                390,
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                218) /
                                            797,
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
                            0,
                            (MediaQuery.of(context).size.height * 30) / 797,
                            0,
                            (MediaQuery.of(context).size.height * 32) / 797),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: (MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  14) /
                                              797 >
                                          (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  14) /
                                              390
                                      ? (MediaQuery.of(context).size.width *
                                              14) /
                                          390
                                      : (MediaQuery.of(context).size.height *
                                              14) /
                                          797,
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
                  height: (MediaQuery.of(context).size.height * 52) / 797,
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
                    padding: EdgeInsetsDirectional.fromSTEB(
                        (MediaQuery.of(context).size.width * 16) / 390,
                        0,
                        (MediaQuery.of(context).size.width * 16) / 390,
                        0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Color(0x00F4472B),
                          borderRadius: 16,
                          borderWidth: 0,
                          buttonSize:
                              (MediaQuery.of(context).size.width * 48) / 390,
                          fillColor: Color(0x00BE7C71),
                          icon: Icon(
                            FFIcons.kquestion,
                            color: FlutterFlowTheme.of(context).lineColor,
                            size:
                                (MediaQuery.of(context).size.width * 24) / 390,
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
                          buttonSize:
                              (MediaQuery.of(context).size.width * 48) / 390,
                          fillColor: Color(0x00BE7C71),
                          icon: Icon(
                            FFIcons.ksettings,
                            color: FlutterFlowTheme.of(context).lineColor,
                            size:
                                (MediaQuery.of(context).size.width * 24) / 390,
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
