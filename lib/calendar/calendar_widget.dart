import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

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
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<TourRecord> calendarTourRecordList =
                            snapshot.data!;
                        final calendarTourRecord =
                            calendarTourRecordList.isNotEmpty
                                ? calendarTourRecordList.first
                                : null;
                        return FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          iconColor: Color(0x00FFFFFF),
                          weekFormat: false,
                          weekStartsMonday: true,
                          initialDate: calendarTourRecord!.calendar,
                          rowHeight: 36,
                          onChange: (DateTimeRange? newSelectedDate) {
                            setState(
                                () => calendarSelectedDay = newSelectedDate);
                          },
                          titleStyle: GoogleFonts.getFont(
                            'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          dayOfWeekStyle: GoogleFonts.getFont(
                            'Inter',
                            color: Color(0xFF6D93A2),
                            fontSize: 12,
                          ),
                          dateStyle: GoogleFonts.getFont(
                            'Inter',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontWeight: FontWeight.bold,
                          ),
                          selectedDateStyle: GoogleFonts.getFont(
                            'Inter',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontWeight: FontWeight.bold,
                          ),
                          inactiveDateStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).lineColor,
                            fontWeight: FontWeight.bold,
                          ),
                          locale: FFLocalizations.of(context).languageCode,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 292,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '5bul3epj' /* Your journey will begin on Oct... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFD9DCDE),
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FFIcons.kbed,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '15wx4hjx' /* A double room has been booked ... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFD9DCDE),
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
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ijy45luh' /* Set a reminder */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'aiihtg6z' /* BACK */,
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
