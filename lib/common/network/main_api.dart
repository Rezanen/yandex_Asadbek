import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:yandex_asadbek/data/api/response/geocoder_resp.dart';

import 'api_base.dart';

@injectable
class MainApi {

  final ApiBase _base;

  MainApi(this._base);

  Future<GeocoderResp?> search(double lat, double lon) async {
    try {
      final response = await _base.dio.get(
        "",
        queryParameters: {
          'apikey': "ffe84d02-6ff4-4ff8-803f-a141b35c7310",
          'geocode': "$lon,$lat",
          'format': "json"
        },
      );
      if (response.statusCode == 200) {
        return GeocoderResp.fromJson(response.data);
      } else {
        return null;
      }
    } on SocketException {
      return null;
    } catch (e) {}
    return null;
  }
}
