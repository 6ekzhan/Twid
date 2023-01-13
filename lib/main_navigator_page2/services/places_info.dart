import 'package:twid/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:twid/flutter_flow/flutter_flow_util.dart';

class PlacesInfo {
  static Future<Map<String, dynamic>> getPlace(String placeId) async {
    final String uri =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_api_key";
    var response = await http.get(Uri.parse(uri));
    var json = jsonDecode(response.body);
    return json;
  }
}
