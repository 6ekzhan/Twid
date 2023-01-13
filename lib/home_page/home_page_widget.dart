import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../instructions010_copy/instructions010_copy_widget.dart';
import '../trip1/trip1_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController? pinCodeController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    pinCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF002532),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: (MediaQuery.of(context).size.width * 360) / 360,
                  height: (MediaQuery.of(context).size.height * 75) / 800,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 100) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFF4472B),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: true,
                          autoFocus: false,
                          showCursor: true,
                          cursorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          obscureText: false,
                          pinTheme: PinTheme(
                            fieldHeight: 40,
                            fieldWidth: 50,
                            borderWidth: 2,
                            borderRadius: BorderRadius.circular(12),
                            shape: PinCodeFieldShape.underline,
                            activeColor: Color(0x00000000),
                            inactiveColor: Color(0x00000000),
                            selectedColor: Color(0x00000000),
                            activeFillColor: Color(0x00000000),
                            inactiveFillColor: Color(0x00000000),
                            selectedFillColor: Color(0x00000000),
                          ),
                          controller: pinCodeController,
                          onChanged: (_) => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -0.8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (pinCodeController!.text != null &&
                          pinCodeController!.text != '') {
                        if (pinCodeController!.text ==
                            FFAppState().pinput.toString()) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Trip1Widget(),
                            ),
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('incorrect pin'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('empty field'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      '5tzuumc9' /* OK */,
                    ),
                    options: FFButtonOptions(
                      width: 236,
                      height: 48,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Inter',
                                color: Color(0xFFA5AAAD),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFFA5AAAD),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0.9),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ai2vnv38' /* If you have not yet chosen a r... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFD9DCDE),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -0.9),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Instructions010CopyWidget(),
                        ),
                      );
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '6i1j2l2u' /* How to use the app? */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFD9DCDE),
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
    );
  }
}
