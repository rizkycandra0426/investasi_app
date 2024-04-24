import 'package:intl/intl.dart';

extension CurrencyFormatExtension on num {
  String get currency {
    NumberFormat numberFormat =
        NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: '');
    return "" + numberFormat.format(this);
  }
}
