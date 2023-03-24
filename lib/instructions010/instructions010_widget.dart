import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import '../trip2/trip2_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Instructions010Widget extends StatefulWidget {
  const Instructions010Widget({Key? key}) : super(key: key);

  @override
  _Instructions010WidgetState createState() => _Instructions010WidgetState();
}

class _Instructions010WidgetState extends State<Instructions010Widget> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height * 49) / 797,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'scniofx1' /* PLEASE READ THE RULES */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFD9DCDE),
                        fontSize: (MediaQuery.of(context).size.height * 12) /
                                    797 >
                                (MediaQuery.of(context).size.width * 12) / 390
                            ? (MediaQuery.of(context).size.width * 12) / 390
                            : (MediaQuery.of(context).size.height * 12) / 797,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height * 612) / 797,
                decoration: BoxDecoration(
                  color: Color(0x00D9DCDE),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'assets/images/BG_&_logo.png',
                    ).image,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            (MediaQuery.of(context).size.height * 16) / 797,
                            0,
                            (MediaQuery.of(context).size.height * 16) / 797),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.kcar,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * 320) /
                                  390,
                              color: Color(0x00FFFFFF),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                24) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'sxcy9gwi' /* RULES FOR USING THE CAR */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        16) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        16) /
                                                    797,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                16) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797,
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'vh0yu7xd' /* 1. Qui exercitationem esse nis... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  12) /
                                                              797 >
                                                          (MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  12) /
                                                              390
                                                      ? (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              12) /
                                                          390
                                                      : (MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              12) /
                                                          797,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        thickness:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 48) / 797,
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.klist,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * 320) /
                                  390,
                              color: Color(0x00FFFFFF),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                24) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kj98caru' /* INSURANCE RULES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        16) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        16) /
                                                    797,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                16) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797,
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '9d7fg3xw' /* 1. Qui exercitationem esse nis... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  12) /
                                                              797 >
                                                          (MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  12) /
                                                              390
                                                      ? (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              12) /
                                                          390
                                                      : (MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              12) /
                                                          797,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        thickness:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 48) / 797,
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.kbed,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * 320) /
                                  390,
                              color: Color(0x00FFFFFF),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                24) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'h4tiew0k' /* RULES FOR USING HOTEL ARMOR */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        16) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        16) /
                                                    797,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                16) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797,
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ls5q6opd' /* 1. Qui exercitationem esse nis... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  12) /
                                                              797 >
                                                          (MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  12) /
                                                              390
                                                      ? (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              12) /
                                                          390
                                                      : (MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              12) /
                                                          797,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        thickness:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 48) / 797,
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.kshield,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * 320) /
                                  390,
                              color: Color(0x00FFFFFF),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                24) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rykgo23m' /* SAFETY RULES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        16) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        16) /
                                                    797,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                16) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797,
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'q7mejtp8' /* 1. Qui exercitationem esse nis... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  12) /
                                                              797 >
                                                          (MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  12) /
                                                              390
                                                      ? (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              12) /
                                                          390
                                                      : (MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              12) /
                                                          797,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        thickness:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 48) / 797,
                            (MediaQuery.of(context).size.width * 16) / 390,
                            (MediaQuery.of(context).size.height * 16) / 797),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.kcall,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * 320) /
                                  390,
                              color: Color(0x00FFFFFF),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                24) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'htnzwlpv' /* EMERGENCY COMMUNICATION */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                ? (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        16) /
                                                    390
                                                : (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        16) /
                                                    797,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        (MediaQuery.of(context).size.width *
                                                16) /
                                            390,
                                        0,
                                        0,
                                        0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797,
                                                  0,
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          8) /
                                                      797),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'w80no2r8' /* 1. Qui exercitationem esse nis... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  12) /
                                                              797 >
                                                          (MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  12) /
                                                              390
                                                      ? (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              12) /
                                                          390
                                                      : (MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              12) /
                                                          797,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        thickness:
                            (MediaQuery.of(context).size.height * 0.5) / 797,
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 390,
                    (MediaQuery.of(context).size.height * 16) / 797,
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Trip2Widget(),
                      ),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'ytdd4c9f' /* I READ IT. I AGREE */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 797,
                    color: Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 390,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Align(
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
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
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
                              size: (MediaQuery.of(context).size.width * 24) /
                                  390,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
