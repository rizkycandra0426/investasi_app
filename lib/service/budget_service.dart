import 'package:hyper_ui/service/db_service.dart';

double getBudget(String name) {
  var budget = 0.0;
  if (DBService.get("budget_${name}") != null) {
    budget = double.parse(DBService.get("budget_${name}").toString());
  }
  return budget;
}

void setBudget(String name, double value) {
  DBService.set("budget_${name}", value.toString());
}
