import 'dart:convert';

class TransactionByMonthAndYearResponse {
  List<HistoryHarian>? data;

  TransactionByMonthAndYearResponse({
    this.data,
  });

  factory TransactionByMonthAndYearResponse.fromRawJson(String str) =>
      TransactionByMonthAndYearResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionByMonthAndYearResponse.fromJson(
          Map<String, dynamic> json) =>
      TransactionByMonthAndYearResponse(
        data: json["data"] == null
            ? []
            : List<HistoryHarian>.from(
                json["data"]!.map((x) => HistoryHarian.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class HistoryHarian {
  int? id;
  int? userId;
  DateTime? tanggal;
  int? jumlah;
  String? catatan;
  int? idKategori;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;
  String? type;

  HistoryHarian({
    this.id,
    this.userId,
    this.tanggal,
    this.jumlah,
    this.catatan,
    this.idKategori,
    this.namaKategori,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  factory HistoryHarian.fromRawJson(String str) =>
      HistoryHarian.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryHarian.fromJson(Map<String, dynamic> json) => HistoryHarian(
        id: json["id"],
        userId: json["user_id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jumlah: json["jumlah"],
        catatan: json["catatan"],
        idKategori: json["id_kategori"],
        namaKategori: json["nama_kategori"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jumlah": jumlah,
        "catatan": catatan,
        "id_kategori": idKategori,
        "nama_kategori": namaKategori,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "type": type,
      };
}
