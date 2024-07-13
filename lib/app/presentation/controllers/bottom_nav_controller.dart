import 'package:get/get.dart';
import 'package:softbd_assignment/app/presentation/controllers/calendar_controller.dart';
import 'package:softbd_assignment/app/presentation/controllers/home_controllers.dart';
import '../pages/Home/home_screen.dart';
import '../pages/calendar/calendar_screen.dart';

class BottomNavController extends GetxController{

  RxInt selectedScreen = 0.obs;

  List screenList = [
    const HomeScreen(),
    const CalendarScreen(),
    const HomeScreen(),
    const CalendarScreen(),
  ];

  @override
  void onInit() {
    loadBinding(selectedScreen.value);
    super.onInit();
  }

  loadBinding(int index){
    switch(index){
      case 0:
        Get.put<HomeController>(HomeController());
        break;
      case 1:
        Get.put<CalendarController>(CalendarController());
        break;
      case 2:
        Get.put<HomeController>(HomeController());
        break;
      case 3:
        Get.put<CalendarController>(CalendarController());
        break;
    }
  }

}