import 'package:flutter/material.dart';

extension KeyExtension on Key {
  String getTableName(var suffix) {
    var keyName = this.toString();
    var regex = RegExp("'(.*?)'");
    var match = regex.firstMatch(keyName);
    var tableName = match?.group(1)!.split("$suffix").first;
    return tableName!;
  }
}
