import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_navigator_page/main_navigator_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 3.58,
                  height: 76,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 216, 16, 8),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: FFLocalizations.of(context).getText(
                      'jkiwjbqf' /* Введите номер бронирования  */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFD9DCDE),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF4472B),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF4472B),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFD9DCDE),
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigatorPageWidget(),
                      ),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'ypfz29i7' /* OK */,
                  ),
                  options: FFButtonOptions(
                    width: 236,
                    height: 48,
                    color: Color(0xFF002532),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFA5AAAD),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 148, 0, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2eqpkck1' /* Если вы еще не выбрали маршрут... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFD9DCDE),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'b0eqhtut' /* Как использовать приложение? */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFD9DCDE),
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
