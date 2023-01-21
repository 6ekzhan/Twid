import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import '../trip1/trip1_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({Key? key}) : super(key: key);

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'se982brr' /* PORSCHE */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Metal',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '4itqy889' /* 911 CARRERA GTS */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFF4472B),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 56, 40, 48),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/porsche-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '73d3z6ux' /* The Porsche 911 has 2 Petrol E... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ejghvpv0' /* Fuel Type  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'zn9mef4k' /* Petrol */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'dezaokwk' /* Max Power (bhp@rpm) */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'fte8qpws' /* 641.00bhp@6500 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'qfav8hk6' /* Seating Capacity */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '5d25xzjn' /* 2 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '3frqgzej' /* Transmission Type */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'r5lepaf7' /* Automatic */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ibx5jke2' /* Tank Capacity */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'b599lfqg' /* 64.0 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FFIcons.kgasoline,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'iddzjb26' /* Before starting the journey, t... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Trip1Widget(),
                      ),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'ar9hcqzj' /* BACK */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: Color(0x004B39EF),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
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
            ],
          ),
        ),
      ),
    );
  }
}
