import 'package:get/get.dart';
import 'package:softbd_assignment/app/presentation/widgets/helpers.dart';

class HomeController extends GetxController{

  DateTime nextDate1 = DateTime(2030, 1, 31);
  DateTime nextDate2 = DateTime(2024, 1, 1);

  List<String> formattedList = [];

  double dateProgress = 0.0;

  @override
  void onInit() {
    super.onInit();
    newDifference(nextDate2, nextDate1);
    percentCalculation(nextDate2, nextDate1);
  }

  convertToBengali(formatItem) => Helpers().convertEnglishNumberToBengali(formatItem);

  List<String> newDifference(DateTime from, DateTime to) {
    formattedList.clear();
    int years = to.year - from.year;
    int months = to.month - from.month;
    int days = to.day - from.day;

    if (days < 0) {
      int borrow = DateTime(from.year, from.month + 1, 0).day;
      days += borrow;
      months--;
    }

    if (months < 0) {
      months += 12;
      years--;
    }

    String yearsStr = years.toString().padLeft(2, '0');
    String monthsStr = months.toString().padLeft(2, '0');
    String daysStr = days.toString().padLeft(2, '0');

    formattedList.add(yearsStr[0]);
    formattedList.add(yearsStr[1]);
    formattedList.add(monthsStr[0]);
    formattedList.add(monthsStr[1]);
    formattedList.add(daysStr[0]);
    formattedList.add(daysStr[1]);
    return formattedList;
  }

  String getTotalTimeElapsed(formattedList){
    if(formattedList[0].toString() == '0' && formattedList[1].toString() == '0'){
      return '${convertToBengali(formattedList[2])}${convertToBengali(formattedList[3])} মাস '
          '${convertToBengali(formattedList[4])}${convertToBengali(formattedList[5])} দিন';
    } else if(formattedList[2].toString() == '0' && formattedList[3].toString() == '0'){
      return '${convertToBengali(formattedList[0])}${convertToBengali(formattedList[1])} বছর '
          '${convertToBengali(formattedList[4])}${convertToBengali(formattedList[5])} দিন';
    } else if(formattedList[4].toString() == '0' && formattedList[5].toString() == '0'){
      return '${convertToBengali(formattedList[0])}${convertToBengali(formattedList[1])} বছর '
          '${convertToBengali(formattedList[2])}${convertToBengali(formattedList[3])} মাস';
    } else {
      return '${convertToBengali(formattedList[0])}${convertToBengali(formattedList[1])} বছর '
          '${convertToBengali(formattedList[2])}${convertToBengali(formattedList[3])} মাস'
          '${convertToBengali(formattedList[4])}${convertToBengali(formattedList[5])} দিন';
    }
  }

  percentCalculation(DateTime from, DateTime to){
    final difference = to.difference(from).inDays;
    final difference2 = DateTime.now().difference(from).inDays;
    dateProgress = (difference2 / difference) * 100;
  }
}


