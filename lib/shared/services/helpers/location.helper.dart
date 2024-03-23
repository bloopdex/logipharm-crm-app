import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static Future<String> addressFromLongitudeLatitude(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    print(place);
    print(
        "${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}");
    return "${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}";
  }
}
