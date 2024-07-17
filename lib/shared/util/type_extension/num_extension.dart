import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String get format {
    if ((this ?? 0).toString().endsWith('.0')) {
      return (this ?? 0).floor().toString();
    }
    return (this ?? 0).toString();
  }

  String get currency {
    return 'Rp${NumberFormat().format((this ?? 0).floor())}';
  }

  String get percentage {
    var value = double.parse(double.parse(this.toString()).toStringAsFixed(2));
    return '${NumberFormat().format(value)}%';
  }

  String get number {
    if (this == null) return '0';
    var value = (this! * 1.0);
    return '${NumberFormat().format((value ?? 0).floor())}';
  }

  String get number2 {
    var value = double.parse(double.parse(this.toString()).toStringAsFixed(2));
    return '${NumberFormat().format(value)}';
  }
}

extension IntExtension on int? {
  String get format {
    if ((this ?? 0).toString().endsWith('.0')) {
      return (this ?? 0).floor().toString();
    }
    return (this ?? 0).toString();
  }

  String get currency {
    return 'Rp${NumberFormat().format((this ?? 0).floor())}';
  }

  String get percentage {
    return '${NumberFormat().format((this ?? 0).floor())}%';
  }

  String get number {
    return '${NumberFormat().format((this ?? 0).floor())}';
  }
}

extension CurrencyStringExtension on String? {
  String get currency {
    return 'Rp${NumberFormat().format((double.tryParse(this.toString()) ?? 0).floor())}';
  }

  String get number {
    return '${NumberFormat().format((double.tryParse(this.toString()) ?? 0).floor())}';
  }
}
