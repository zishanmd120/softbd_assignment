import 'package:get/get.dart';
import '../../presentation/controllers/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavController>(
      BottomNavController(),
    );
  }
}
