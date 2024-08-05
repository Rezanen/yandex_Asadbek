import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class LocationData extends HiveObject {
  @HiveField(0)
  double lat;
  @HiveField(1)
  double lon;
  @HiveField(2)
  String placeName;

  LocationData(this.lat, this.lon, this.placeName);
}
