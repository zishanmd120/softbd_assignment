import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/models/todays_task_model.dart';
import '../../data/providers/work_provider.dart';
import '../widgets/helpers.dart';

class CalendarController extends GetxController{

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(null);


  TextEditingController titleEditingController = TextEditingController();
  TextEditingController titleDivEditingController = TextEditingController();
  TextEditingController titleDateEditingController = TextEditingController();
  TextEditingController titlePlaceEditingController = TextEditingController();
  TextEditingController titleDesEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getWorkList();
  }

  TodayWorkModel ? todayWorkList;
  RxBool isWorkListLoading = false.obs;
  Future<void> getWorkList() async{
    isWorkListLoading.value = true;
    var response = await WorkList().getTodayWorkList();
    print(response);
    if(response != null){
      todayWorkList = response;
      getWorkListWithDate(DateTime.now());
      isWorkListLoading.value = false;
    }
  }

  List<Data> filteredData = [];
  List<Data> getWorkListWithDate(DateTime selectedDate) {
    isWorkListLoading.value = true;
    filteredData.clear();
    filteredData.addAll(todayWorkList?.data?.where((element) {
      DateTime itemDate = DateTime.fromMillisecondsSinceEpoch(int.parse(element.date ?? '') * 1000);
      return isSameDay(selectedDate, itemDate);
    }) ?? []);
    isWorkListLoading.value = false;
    return filteredData;
  }


  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String getShortDayName(DateTime date) {
    String dayName = DateFormat('EEEE').format(date);
    switch (dayName) {
      case 'Monday':
        return 'সোম';
      case 'Tuesday':
        return 'মঙ্গল';
      case 'Wednesday':
        return 'বুধ';
      case 'Thursday':
        return 'বৃহ:';
      case 'Friday':
        return 'শুক্র';
      case 'Saturday':
        return 'শনি';
      case 'Sunday':
        return 'রবি';
      default:
        return '';
    }
  }

  getDayTime(String timestamp){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((int.tryParse(timestamp) ?? 0) * 1000);
    String formattedDayTime = DateFormat('HH').format(dateTime);
    int hour = int.tryParse(formattedDayTime) ?? 0;
    if (hour >= 4 && hour < 6) {
      return 'ভোর \n${getTime(timestamp)}';
    } else if (hour >= 6 && hour < 12) {
      return 'সকাল \n${getTime(timestamp)}';
    } else if (hour >= 12 && hour < 14) {
      return 'দুপুর \n${getTime(timestamp)}';
    } else if (hour >= 14 && hour < 17) {
      return 'বিকাল \n${getTime(timestamp)}';
    } else if (hour >= 17 && hour < 21) {
      return 'সন্ধ্যা \n${getTime(timestamp)}';
    } else {
      return 'রাত \n${getTime(timestamp)}';
    }
  }

  getTime(String timestamp){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((int.tryParse(timestamp) ?? 0) * 1000);
    String formattedTime = DateFormat('h:mm').format(dateTime);
    var finalNumber = Helpers().convertEnglishNumberToBengali(formattedTime);
    return '$finalNumber মি.';
  }

}