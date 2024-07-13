import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_assignment/app/presentation/controllers/calendar_controller.dart';
import 'package:softbd_assignment/app/presentation/controllers/home_controllers.dart';
import '../pages/Home/home_screen.dart';
import '../pages/calendar/calendar_screen.dart';

class BottomNavController extends GetxController{

  final RxInt selectedScreen = 0.obs;

  List<Widget> screenList = [
    const HomeScreen(),
    const CalendarScreen(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  void onInit() {
    super.onInit();
    loadBinding(selectedScreen.value);
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
        // Get.put<HomeController>(HomeController());
        break;
      case 3:
        // Get.put<CalendarController>(CalendarController());
        break;
    }
  }

}