import 'package:dio/dio.dart';
import 'package:hyper_ui/model/kategori_pemasukan_response.dart';

class BaseService<T> {
  String baseUrl = "http://10.168.55.234:8000/api";
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
    var response = await Dio().post(
      "$baseUrl/$endpoint/$id",
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
    var response = await Dio().post(
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
