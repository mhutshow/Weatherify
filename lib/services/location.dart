import 'package:geolocator/geolocator.dart';
class Location {
  double longitude ;
  double latitude ;

  Future<void> getLocation()async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}