import 'package:dio/dio.dart';
import 'package:hyper_ui/model/current_user.dart';
import 'package:hyper_ui/service/base_service.dart';

String token = "";
CurrentUser? currentUser;

class AuthService extends BaseService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "$baseUrl/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      token = obj["data"]["accessToken"];
      currentUser = CurrentUser.fromJson(obj["data"]["userData"]!);
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await Dio().post(
        "$baseUrl/register",
        options: Options(
          headers: {
            "Content-Type": "application/json",
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
}
