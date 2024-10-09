// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LocationService {
//   // Location location = Location();

//   Future<bool> checkLocationPermission() async {
//     var status = await Permission.location.request();

//     if (status.isGranted) {
//       return true;
//     } else if (status.isDenied) {
//       return false;
//     }

//     return false;
//   }

//   Future<bool> isLocationEnabled() async {
//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//     }
//     return serviceEnabled;
//   }
// }
