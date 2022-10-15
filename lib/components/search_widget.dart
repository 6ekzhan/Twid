import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../trip1/trip1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
            reverseDuration: Duration(milliseconds: 0),
            child: Trip1Widget(),
          ),
        );
      },
      text: 'OK',
      options: FFButtonOptions(
        width: 236,
        height: 48,
        color: Color(0x00A5AAAD),
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Inter',
              color: Color(0xFFA5AAAD),
            ),
        borderSide: BorderSide(
          color: Color(0xFFA5AAAD),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
