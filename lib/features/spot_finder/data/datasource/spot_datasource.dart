import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/dio_client.dart';

Dio http = DioClient.instance();

class SpotRemoteDatasource {

  String path = "/mvv/XML_STOPFINDER_REQUEST";
  String language = "de";
  String outputFormat = "RapidJSON";
  String coordOutputFormat = "WGS84[DD:ddddd]";
  String type_sf = "any";

  Future<List<dynamic>> getSpots({String? name_sf}) async {
    final String searchParam = name_sf == null || name_sf.isEmpty ? "{search_text}" : name_sf;
    final String requestUrl =
        "$path?language=$language&outputFormat=$outputFormat&coordOutputFormat=$coordOutputFormat&type_sf=$type_sf&name_sf=$searchParam";
    try {
      final Response<dynamic> response = await http.get(requestUrl);
      final dynamic data = response.data;
      debugPrint("DATA IS EUQAL TO : $data");

      if(data is Map<String, dynamic>){
        return data["locations"];
      }
      return <dynamic>[];
    } on DioException catch (e) {
      // Avoid unsafe cast; ensure a meaningful message
      throw Failure(errorMsg: e.message ?? e.toString());
    } catch (e) {
      throw Failure();
    }
  }
}