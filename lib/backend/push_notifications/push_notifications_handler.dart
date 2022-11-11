import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/slash_screen.png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Language': (data) async => LanguageWidget(),
  'Trip1': (data) async => Trip1Widget(),
  'Instructions010': (data) async => Instructions010Widget(),
  'Instructions010Copy': (data) async => Instructions010CopyWidget(),
  'Trip2': (data) async => Trip2Widget(),
  'TripStart': (data) async => TripStartWidget(),
  'MainNavigatorPage': (data) async => MainNavigatorPageWidget(),
  'PlaceInformation': (data) async => PlaceInformationWidget(),
  'PlaceInformationPoint': (data) async => PlaceInformationPointWidget(),
  'MainNavigatorPage2': (data) async => MainNavigatorPage2Widget(),
  'MainNavigatorPagePlaceInfo': (data) async =>
      MainNavigatorPagePlaceInfoWidget(),
  'MainNavigatorPageFinish': (data) async => MainNavigatorPageFinishWidget(),
  'TripFinish': (data) async => TripFinishWidget(),
  'TripFinish2': (data) async => TripFinish2Widget(),
  'CALENDAR': (data) async => CalendarWidget(),
  'CAR': (data) async => CarWidget(),
  'AboutPlace': (data) async => AboutPlaceWidget(),
  'TakeaCar': (data) async => TakeaCarWidget(),
  'Settings': (data) async => SettingsWidget(),
  'Questions': (data) async => QuestionsWidget(),
  'Help': (data) async => HelpWidget(),
  'SUPPORT': (data) async => SupportWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
