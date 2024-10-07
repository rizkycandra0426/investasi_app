import 'package:hyper_ui/service/base_service.dart';

class NotificationSchedulerService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "notification-scheduler";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
