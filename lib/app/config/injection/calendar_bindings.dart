import 'package:get/get.dart';
import '../../presentation/controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CalendarController>(
      CalendarController(),
    );
  }
}
