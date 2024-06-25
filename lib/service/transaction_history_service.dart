import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import 'package:hyper_ui/model/transaction_by_year_response.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';

class TransactionHistoryService extends BaseService {
  Future<TransactionByMonthAndYearResponse> byMonthAndYear({
    required int month,
    required int year,
  }) async {
    var response = await dio.get(
      "$baseUrl/transaction-histories/$month/$year",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return TransactionByMonthAndYearResponse.fromJson(response.data);
  }

  Future<TransactionByYearResponse> byYear({
    required int year,
  }) async {
    var response = await dio.get(
      "$baseUrl/transaction-histories/$year",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return TransactionByYearResponse.fromJson(response.data);
  }

  Future<TransactionCategoriesByYearResponse> categoriesByMonthAndYear({
    required int month,
    required int year,
  }) async {
    var response = await dio.get(
      "$baseUrl/transaction-histories/categories/$month/$year",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return TransactionCategoriesByYearResponse.fromJson(response.data);
  }
}
