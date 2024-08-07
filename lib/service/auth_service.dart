import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/current_user.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/service/db_service.dart';
import 'package:hyper_ui/service/offline_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

String? get token => DBService.get("token");
CurrentUser? currentUser;

class AuthService extends BaseService {
  Future loadCurrentUserData() async {
    var jsonString = DBService.get("current_user");
    if (jsonString != null) {
      currentUser = CurrentUser.fromJson(jsonDecode(jsonString));
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "$baseUrl/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'ngrok-skip-browser-warning': true,
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      currentUser = CurrentUser.fromJson(obj["data"]["userData"]!);
      DBService.set("token", obj["data"]["accessToken"]);
      DBService.set("current_user", jsonEncode(currentUser!.toJson()));
      Diointerceptors.setOptions();
      await OfflineService.loadLocalValues();

      refreshUserDataViewer();
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }

  Future checkLogin({
    required String email,
    required String password,
  }) async {
    try {
      await dio.post(
        "$baseUrl/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'ngrok-skip-browser-warning': true,
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
    } on Exception catch (err) {
      print(err);
      throw Exception("Failed");
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await dio.post(
        "$baseUrl/register",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'ngrok-skip-browser-warning': true,
          },
        ),
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }

  Future<void> logout() async {
    currentUser = null;
    //Kalau sudah tidak perlu dibuang
    DBService.clear("id_berita");
    //----------------

    DBService.clear("token");
    DBService.clear("current_user");
  }
}
