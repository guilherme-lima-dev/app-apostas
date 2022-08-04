import 'package:dio/dio.dart';
import 'package:ole_players_app/service/http_client_interface.dart';

class DioClient implements IHttpClient{
  final dio = Dio();

  @override
  Future get(String url) async{
    final response = await dio.get(url);
    return response.data;
  }

}