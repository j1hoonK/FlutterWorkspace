import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation()async{  // 위치정보 가져오기
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print('position: $position');
      print('latitude2: $latitude2');
      print('longitude2: $longitude2');
    } on Exception catch (e) {
      // TODO
      print('err');
    }

  }

}