// TODO Implement this library.
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:twid/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:twid/flutter_flow/flutter_flow_util.dart' as FF;

class PlacesInfo {
  static Future<List<String>> getPlacesId(LatLng coordinates) async {
    // final String uri =
    // "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_api_key";
    final String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${coordinates.latitude},${coordinates.longitude}&key=$google_api_key&radius=100";
    var response = await http.get(Uri.parse(url));
    List<dynamic> json = FF.jsonDecode(response.body)["results"];
    List<String> placesId = [];
    json.forEach((element) {
      placesId.add(element["place_id"]);
    });
    return placesId;
  }

  static Future<List<dynamic>> getPlaces(List<String> placesId) async {
    List res = [];
    for (var i = 0; i < placesId.length; i++) {
      final String uri =
          "https://maps.googleapis.com/maps/api/place/details/json?place_id=${placesId[i]}&key=$google_api_key";
      var response = await http.get(Uri.parse(uri));
      var json = FF.jsonDecode(response.body)["result"];
      res.add(json);
    }
    return res;
  }
}
