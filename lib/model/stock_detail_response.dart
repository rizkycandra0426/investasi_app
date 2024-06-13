import 'dart:convert';

class StockDetailResponse {
  Response? response;

  StockDetailResponse({
    this.response,
  });

  StockDetailResponse copyWith({
    Response? response,
  }) =>
      StockDetailResponse(
        response: response ?? this.response,
      );

  factory StockDetailResponse.fromRawJson(String str) =>
      StockDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StockDetailResponse.fromJson(Map<String, dynamic> json) =>
      StockDetailResponse(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
      };
}

class Response {
  String? status;
  String? message;
  Data? data;

  Response({
    this.status,
    this.message,
    this.data,
  });

  Response copyWith({
    String? status,
    String? message,
    Data? data,
  }) =>
      Response(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory Response.fromRawJson(String str) =>
      Response.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Result>? results;

  Data({
    this.results,
  });

  Data copyWith({
    List<Result>? results,
  }) =>
      Data(
        results: results ?? this.results,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? symbol;
  Company? company;
  DateTime? date;
  int? open;
  int? high;
  int? low;
  int? close;
  int? volume;
  int? change;
  double? changePct;

  Result({
    this.symbol,
    this.company,
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.change,
    this.changePct,
  });

  Result copyWith({
    String? symbol,
    Company? company,
    DateTime? date,
    int? open,
    int? high,
    int? low,
    int? close,
    int? volume,
    int? change,
    double? changePct,
  }) =>
      Result(
        symbol: symbol ?? this.symbol,
        company: company ?? this.company,
        date: date ?? this.date,
        open: open ?? this.open,
        high: high ?? this.high,
        low: low ?? this.low,
        close: close ?? this.close,
        volume: volume ?? this.volume,
        change: change ?? this.change,
        changePct: changePct ?? this.changePct,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        symbol: json["symbol"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        open: json["open"],
        high: json["high"],
        low: json["low"],
        close: json["close"],
        volume: json["volume"],
        change: json["change"],
        changePct: json["change_pct"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "company": company?.toJson(),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume": volume,
        "change": change,
        "change_pct": changePct,
      };
}

class Company {
  String? symbol;
  String? name;
  String? logo;

  Company({
    this.symbol,
    this.name,
    this.logo,
  });

  Company copyWith({
    String? symbol,
    String? name,
    String? logo,
  }) =>
      Company(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        logo: logo ?? this.logo,
      );

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        symbol: json["symbol"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "logo": logo,
      };
}
