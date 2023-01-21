import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import '../trip1/trip1_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                    child: SelectionArea(
                        child: Text(
                      FFLocalizations.of(context).getText(
                        'vqz0mtym' /* SUPPORT SERVICE */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFF4472B),
                            fontSize: 20,
                          ),
                    )),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'l0ff1ngm' /* THANKS! */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Metal',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(77, 26, 77, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'f25pvfm9' /* Valery, hello! Thank you for c... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 38, 0, 0),
                        child: Icon(
                          FFIcons.kmailSUP1,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                    'ddyicczm' /* OK */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56,
                    color: Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
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
