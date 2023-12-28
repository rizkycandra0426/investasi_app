import 'dart:convert';

class TransactionByYearResponse {
  List<Datum>? data;

  TransactionByYearResponse({
    this.data,
  });

  factory TransactionByYearResponse.fromRawJson(String str) =>
      TransactionByYearResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionByYearResponse.fromJson(Map<String, dynamic> json) =>
      TransactionByYearResponse(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? month;
  int? totalPengeluaran;
  int? totalPemasukan;

  Datum({
    this.month,
    this.totalPengeluaran,
    this.totalPemasukan,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        month: json["month"],
        totalPengeluaran: json["total_pengeluaran"],
        totalPemasukan: json["total_pemasukan"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "total_pengeluaran": totalPengeluaran,
        "total_pemasukan": totalPemasukan,
      };
}
