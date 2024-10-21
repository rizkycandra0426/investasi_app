import 'package:hyper_ui/service/db_service.dart';

double getBudget({
  required String name,
  required String month,
}) {
  var budget = 0.0;
  if (DBService.get("budget_${month}_${name}") != null) {
    budget = double.parse(DBService.get("budget_${month}_${name}").toString());
  }
  return budget;
}

void setBudget({
  required String name,
  required String month,
  required double value,
}) {
  DBService.set("budget_${month}_${name}", value.toString());
}
