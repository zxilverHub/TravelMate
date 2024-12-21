import 'package:location/location.dart';

double? latitude; // Latitude, in degrees
double? longitude; // Longitude, in degrees
double?
    accuracy; // Estimated horizontal accuracy of this location, radial, in meters
double? altitude; // In meters above the WGS 84 reference ellipsoid
double? speed; // In meters/second
double? speedAccuracy; // In meters/second, always 0 on iOS and web
double?
    heading; // Heading is the horizontal direction of travel of this device, in degrees
double? time; // timestamp of the LocationData
bool? isMock; // Is the location currently mocked

LocationData? userLocation;

/*

const Placemark({
  String? name,
  String? street,
  String? isoCountryCode,
  String? country,
  String? postalCode,
  String? administrativeArea,
  String? subAdministrativeArea,
  String? locality,
  String? subLocality,
  String? thoroughfare,
  String? subThoroughfare,
})

locality = town
administrativeArea = region
subAdministrativeArea = province
country = country
thoroughfare = connection road
street = street

*/