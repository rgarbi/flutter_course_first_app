import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool isEnabled = await isLocationServiceEnabled();
      if (isEnabled) {
        LocationPermission permission = await checkPermission();

        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {
          Position position =
              await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          latitude = position.latitude;
          longitude = position.longitude;
        } else {
          print('We do not have permission to use location services.');
        }
      } else {
        print('Location services are not enabled');
      }
    } catch (e) {
      print(e);
    }
  }
}
