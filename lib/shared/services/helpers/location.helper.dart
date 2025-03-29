import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<String> addressFromLongitudeLatitude(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    return "${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}";
  }

  static Future<String?> addressFromCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    return "${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}";
  }

  static Future<Position?> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }
}
