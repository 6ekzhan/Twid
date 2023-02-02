import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../trip_start/trip_start_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Trip2Widget extends StatefulWidget {
  const Trip2Widget({Key? key}) : super(key: key);

  @override
  _Trip2WidgetState createState() => _Trip2WidgetState();
}

class _Trip2WidgetState extends State<Trip2Widget> {
  PageController? pageViewController;
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0, (MediaQuery.of(context).size.height * 49) / 797, 0, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0,
                        (MediaQuery.of(context).size.height * 13) / 797, 0, 0),
                    child: PageView(
                      controller: pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    (MediaQuery.of(context).size.height * 32) /
                                        797,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          (MediaQuery.of(context).size.width *
                                                  8) /
                                              390,
                                          0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        borderRadius: 10,
                                        borderWidth:
                                            (MediaQuery.of(context).size.width *
                                                    1) /
                                                390,
                                        buttonSize:
                                            (MediaQuery.of(context).size.width *
                                                    48) /
                                                390,
                                        icon: Icon(
                                          FFIcons.karrowBack,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  20) /
                                              390,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: 10,
                                      borderWidth:
                                          (MediaQuery.of(context).size.width *
                                                  1) /
                                              390,
                                      buttonSize:
                                          (MediaQuery.of(context).size.width *
                                                  48) /
                                              390,
                                      icon: Icon(
                                        FFIcons.karrowForward,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size:
                                            (MediaQuery.of(context).size.width *
                                                    20) /
                                                390,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    (MediaQuery.of(context).size.height * 13) /
                                        797,
                                    0,
                                    0),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width *
                                          358) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          83) /
                                      797,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'pz4ro1we' /* The buttons on the navigator s... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: (MediaQuery.of(context)
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
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/Silver1.png',
                                width: (MediaQuery.of(context).size.width *
                                        222.11) /
                                    390,
                                height:
                                    (MediaQuery.of(context).size.height * 450) /
                                        797,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    (MediaQuery.of(context).size.height *
                                            38.68) /
                                        797,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await pageViewController?.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'vin93ofb' /* OK. NEXT */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height:
                                        (MediaQuery.of(context).size.height *
                                                48) /
                                            797,
                                    color: Color(0x00F4472B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.bold,
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
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  1) /
                                              390,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    (MediaQuery.of(context).size.height * 31) /
                                        797,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width *
                                          358) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          49) /
                                      797,
                                  decoration: BoxDecoration(
                                    color: Color(0x00D9DCDE),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.asset(
                                        'assets/images/new_point.png',
                                      ).image,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    (MediaQuery.of(context).size.height * 13) /
                                        797,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width *
                                          358) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          83) /
                                      797,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'kuswjwgq' /* Upon reaching a new point, the... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: (MediaQuery.of(context)
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
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    (MediaQuery.of(context).size.height *
                                            38.68) /
                                        797),
                                child: Image.asset(
                                  'assets/images/Silver1.png',
                                  width: (MediaQuery.of(context).size.width *
                                          222.11) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          450) /
                                      797,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await pageViewController?.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ncaulhea' /* OK. NEXT */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height:
                                        (MediaQuery.of(context).size.height *
                                                48) /
                                            797,
                                    color: Color(0x00F4472B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  1) /
                                              390,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    (MediaQuery.of(context).size.height * 32) /
                                        797,
                                    0,
                                    0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          (MediaQuery.of(context).size.width *
                                                  8) /
                                              390,
                                          0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        borderRadius: 10,
                                        borderWidth:
                                            (MediaQuery.of(context).size.width *
                                                    1) /
                                                390,
                                        buttonSize:
                                            (MediaQuery.of(context).size.width *
                                                    48) /
                                                390,
                                        icon: FaIcon(
                                          FontAwesomeIcons.arrowLeft,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  20) /
                                              390,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: 10,
                                      borderWidth:
                                          (MediaQuery.of(context).size.width *
                                                  1) /
                                              390,
                                      buttonSize:
                                          (MediaQuery.of(context).size.width *
                                                  48) /
                                              390,
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size:
                                            (MediaQuery.of(context).size.width *
                                                    20) /
                                                390,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    (MediaQuery.of(context).size.height * 13) /
                                        797,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width *
                                          358) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          78) /
                                      797,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'c3bdx0kk' /* Moving between points, you can... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: (MediaQuery.of(context)
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
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    (MediaQuery.of(context).size.height *
                                            36.68) /
                                        797),
                                child: Image.asset(
                                  'assets/images/screen.png',
                                  width: (MediaQuery.of(context).size.width *
                                          222.11) /
                                      390,
                                  height: (MediaQuery.of(context).size.height *
                                          450) /
                                      797,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0,
                                    (MediaQuery.of(context).size.width * 16) /
                                        390,
                                    0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TripStartWidget(),
                                      ),
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ioa7i7qj' /* OK */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height:
                                        (MediaQuery.of(context).size.height *
                                                48) /
                                            797,
                                    color: Color(0x00F4472B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Inter',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: pageViewController ??=
                          PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) {
                        pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 8,
                        radius: 1,
                        dotWidth: 6,
                        dotHeight: 6,
                        dotColor: FlutterFlowTheme.of(context).secondaryColor,
                        activeDotColor:
                            FlutterFlowTheme.of(context).primaryColor,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
