import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Future<List> get(String resourceURL) async {
    try {

      Response response = await dio.get(resourceURL);
      return response.data["results"];
    } on DioException catch (e) {
      throw Exception(e.response!.data["results"]["message"]);
      //print(response.data["results"][0]["article_id"]);
    } catch (e) {
      throw Exception(e);
    }
  }
}
