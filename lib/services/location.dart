import 'package:location/location.dart';

class Locationnn {
  double latitude = 0;
  double longitude = 0;
  Future<void> getcurrentlocation() async {
    try {
      Location l1 = new Location();
      LocationData p1 = await l1.getLocation();
      latitude = p1.latitude!;
      longitude = p1.longitude!;
    } catch (e) {
      print(e);
    }
  }
}
