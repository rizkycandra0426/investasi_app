import 'package:dio/dio.dart';
import 'package:hyper_ui/model/kategori_pemasukan_response.dart';

class BaseService<T> {
  // String baseUrl = "http://192.168.18.189:8000/api";
  String baseUrl = "http://192.168.1.78:8000/api";
  String endpoint = "kategori_pemasukans";

  Future<T> get() async {
    var response = await Dio().get(
      "$baseUrl/$endpoint",
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
    var response = await Dio().post(
      "$baseUrl/$endpoint",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: data,
    );
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
    var response = await Dio().delete(
      "$baseUrl/$endpoint/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }
}
