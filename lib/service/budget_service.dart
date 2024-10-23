import 'package:hyper_ui/service/db_service.dart';

double getBudget({
  required String name,
  required String month,
  required String year,
}) {
  var budget = 0.0;
  if (DBService.get("budget_${month}_${year}_${name}") != null) {
    budget = double.tryParse(
            DBService.get("budget_${month}_${year}_${name}").toString()) ??
        0;
  }
  return budget;
}

void setBudget({
  required String name,
  required String month,
  required String year,
  required double value,
}) {
  DBService.set("budget_${month}_${year}_${name}", value.toString());
}
