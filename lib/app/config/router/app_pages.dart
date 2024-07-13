import 'package:get/get.dart';
import 'package:softbd_assignment/app/config/injection/bottom_nav_binding.dart';
import 'package:softbd_assignment/app/config/injection/calendar_bindings.dart';
import '../../presentation/pages/BottomNav/bottom_navbar.dart';
import '../../presentation/pages/Home/home_screen.dart';
import '../../presentation/pages/calendar/add_new_timeline.dart';
import '../../presentation/pages/calendar/calendar_screen.dart';
import '../injection/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static String INITIAL = AppRoutes.bottomNavSection;

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.bottomNavSection,
      page: () => const BottomNavSection(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.calendarScreen,
      page: () => const CalendarScreen(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: AppRoutes.addNewWorkScreen,
      page: () => const AddNewTimeline(),
      binding: CalendarBinding(),
    ),
  ];
}
