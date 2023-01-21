// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

Future emergencyCall() async {
  UrlLauncher.launch("tel:+7-707-396-3155");
}
