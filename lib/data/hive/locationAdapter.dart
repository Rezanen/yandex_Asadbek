
import 'package:hive/hive.dart';

import 'locationData.dart';

class LocationAdapter extends TypeAdapter<LocationData> {
  @override
  final typeId = 0;

  @override
  LocationData read(BinaryReader reader) {
    return LocationData(reader.read() as double, reader.read() as double,
        reader.read() as String);
  }

  @override
  void write(BinaryWriter writer, LocationData obj) {
    writer.write(obj.lat);
    writer.write(obj.lon);
    writer.write(obj.placeName);
  }
}
