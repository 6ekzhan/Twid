import 'package:twid/index.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import '../takea_car/takea_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripStartWidget extends StatefulWidget {
  const TripStartWidget({Key? key}) : super(key: key);

  @override
  _TripStartWidgetState createState() => _TripStartWidgetState();
}

class _TripStartWidgetState extends State<TripStartWidget> {
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
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainNavigatorPage2Widget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFF4472B),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0.5, 20, 0.5, 35),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'tm8bffsz' /* START THE JOURNEY */,
                            ),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Metal',
                                      color: Color(0xFFF4472B),
                                      fontSize: 39,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0.8),
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
                        'adl2jnc3' /* How to pick up the car? */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                    ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
      ),
    );
  }
}
