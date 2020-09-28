import 'package:geolocator/geolocator.dart';


class Location {
  double latitude;
  double longitude;


  Future<void>  getLocation() async {
    Position position;
    try {
      position = await GeolocatorPlatform.instance.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e) {
      print(e);
    }
    return;
  }

}
