import 'dart:convert';

class TransactionCategoriesByYearResponse {
  List<Datum>? data;

  TransactionCategoriesByYearResponse({
    this.data,
  });

  factory TransactionCategoriesByYearResponse.fromRawJson(String str) =>
      TransactionCategoriesByYearResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionCategoriesByYearResponse.fromJson(
          Map<String, dynamic> json) =>
      TransactionCategoriesByYearResponse(
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
  String? namaKategoriPengeluaran;
  int? total;

  Datum({
    this.namaKategoriPengeluaran,
    this.total,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaKategoriPengeluaran: json["nama_kategori_pengeluaran"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "nama_kategori_pengeluaran": namaKategoriPengeluaran,
        "total": total,
      };
}
