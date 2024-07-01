import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/kategori_pemasukan_response.dart';
import 'package:hyper_ui/service/auth_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

// caching

class BaseService<T> {
  // String baseUrl = "http://192.168.18.189:8000/api";
  // String baseUrl = "http://192.168.1.12:8000/api";
  // String baseUrl = "http://10.5.50.139:8000/api";
  String endpoint = "kategori_pemasukans";

  Future<T> get({
    int? page = null,
    Map<String, dynamic>? param,
  }) async {
    var queryParam = {};
    var paramString = "";
    if (page != null) {
      queryParam["page"] = page;
    }

    if (param != null) {
      param.forEach((key, value) {
        queryParam[key] = value;
      });
    }

    if (queryParam.isNotEmpty) {
      paramString =
          "?" + queryParam.entries.map((e) => "${e.key}=${e.value}").join("&");
    }

    var url = "$baseUrl/$endpoint$paramString";
    var response = await dio.get(
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
    var response = await dio.post(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
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

    var response = await dio.post(
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
    var response = await dio.delete(
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
