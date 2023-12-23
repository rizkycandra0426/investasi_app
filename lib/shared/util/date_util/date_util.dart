import 'package:hyper_ui/core.dart';

extension DateTimeExtension on DateTime {
  String get yMd {
    return DateFormat("yyyy-MM-dd").format(DateTime.now());
  }
}
