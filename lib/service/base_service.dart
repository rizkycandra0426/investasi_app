import 'package:dio/dio.dart';
import 'package:hyper_ui/model/kategori_pemasukan_response.dart';
import 'package:hyper_ui/service/auth_service.dart';

class BaseService<T> {
  // String baseUrl = "http://192.168.18.189:8000/api";
  // String baseUrl = "http://192.168.1.12:8000/api";
  String baseUrl = "http://10.5.50.139:8000/api";
  String endpoint = "kategori_pemasukans";

  Future<T> get() async {
    var url = "$baseUrl/$endpoint";
    var response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return decode(response.data);
  }

  T decode(data) {
    dynamic model;
    return model.fromJson(data);
  }

  Future create(Map data) async {
    var url = "$baseUrl/$endpoint";
    print("DATA: TOKEN: ${token}");
    var response = await Dio().post(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: data,
    );
    print("DATA: ${response.data}");
    return response.data;
  }

  Future update(int id, Map data) async {
    var url = "$baseUrl/$endpoint/$id";

    print("URL: $url");
    print("data: $data");
    print("-------------");

    var response = await Dio().post(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: data,
    );
    return response.data;
  }

  Future delete(int id) async {
    var url = "$baseUrl/$endpoint/$id";
    var response = await Dio().delete(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }
}
