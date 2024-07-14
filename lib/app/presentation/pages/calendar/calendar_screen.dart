import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:softbd_assignment/app/config/router/app_routes.dart';
import 'package:softbd_assignment/app/presentation/controllers/calendar_controller.dart';
import 'package:softbd_assignment/app/presentation/widgets/helpers.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/constants/height_width.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'সময়রেখা',
        showNotification: true,
        centerTitle: true,
        isBackButton: false,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'আজ, ১২ জুলাই',
                  style: TextStyle(
                    fontSize: screenWidth(context) * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.addNewWorkScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff86B560),
                          Color(0xff336F4A),
                        ],
                      ),
                    ),
                    child: Text(
                      'নতুন যোগ করুন',
                      style: TextStyle(
                        fontSize: screenWidth(context) * 0.031,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Obx(
              () => TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.focusedDay.value,
                calendarFormat: CalendarFormat.week,
                daysOfWeekHeight: 0,
                rowHeight: 70,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                  controller.getWorkListWithDate(selectedDay);
                },
                headerVisible: false,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, focusDay) {
                    return Center(
                      child: Container(
                        width: screenWidth(context) * 0.1,
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 5,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSameDay(date, DateTime.now())
                                ? Colors.green
                                : Colors.transparent,
                            width: 1.8,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.getShortDayName(date),
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 3,),
                            Text(
                              Helpers().convertEnglishNumberToBengali(
                                  date.day.toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, date, focusDay) {
                    return Center(
                      child: Container(
                        width: screenWidth(context) * 0.1,
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 5,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSameDay(date, DateTime.now())
                              ? Colors.green
                              : Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.getShortDayName(date),
                            ),
                            const SizedBox(height: 3,),
                            Text(
                              Helpers().convertEnglishNumberToBengali(
                                date.day.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  todayBuilder: (context, date, focusDay) {
                    return Center(
                      child: Container(
                        width: screenWidth(context) * 0.1,
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 5,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSameDay(date, DateTime.now())
                                ? Colors.green
                                : Colors.transparent,
                            width: 1.8,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.getShortDayName(date),
                            ),
                            const SizedBox(height: 3,),
                            Text(
                              Helpers().convertEnglishNumberToBengali(
                                date.day.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  outsideBuilder: (context, date, focusDay) {
                    return Center(
                      child: Container(
                        width: screenWidth(context) * 0.1,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSameDay(date, DateTime.now())
                                ? Colors.green
                                : Colors.transparent,
                            width: 1.8,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.getShortDayName(date),
                            ),
                            const SizedBox(height: 3,),
                            Text(
                              Helpers().convertEnglishNumberToBengali(
                                date.day.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0,),
                    child: Text(
                      'আজকের কার্যক্রম',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(() => controller.isWorkListLoading.value ? const CustomListShimmer(count: 7,) : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredData.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = controller.filteredData[index];
                        return Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${controller.getDayTime(item.date ?? '')}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: screenWidth(context) * 0.038,),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.65,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12.0),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff86B560),
                                      Color(0xff336F4A),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          controller.getTime(
                                              item.date ?? ''),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth(context) * 0.038,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      item.name ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth(context) * 0.035,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6,),
                                    Text(
                                      item.category ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth(context) * 0.032,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 5.0,),
                                          child: Image.asset('assets/icons/map.png', width: 15, height: 15, color: Colors.white,),
                                        ),
                                        Text(
                                          item.location ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth(context) * 0.032,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class CustomListShimmer extends StatelessWidget {
  final int count;
  const CustomListShimmer({super.key, required this.count,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 130,
              width: screenWidth(context),
              margin: const EdgeInsets.only(bottom: 10,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        );
      },
    );
  }
}


