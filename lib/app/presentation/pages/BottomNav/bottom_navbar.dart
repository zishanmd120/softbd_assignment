import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_controller.dart';

class BottomNavSection extends GetView<BottomNavController> {
  const BottomNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xff86B560),
                  Color(0xff336F4A),
                ],
              ),
            ),
            child: Image.asset(
              'assets/icons/camera.png',
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 2.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 50,
          color: Colors.white,
          child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectedScreen.value = 0;
                            controller.loadBinding(0);
                          },
                          child: controller.selectedScreen.value == 0
                              ? Image.asset(
                            'assets/icons/home_active.png',
                            height: 30,
                            width: 30,
                          )
                              : Image.asset(
                            'assets/icons/home.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        controller.selectedScreen.value == 0
                            ? Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff86B560),
                                Color(0xff336F4A),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectedScreen.value = 1;
                            controller.loadBinding(1);
                          },
                          child: controller.selectedScreen.value == 1
                              ? Image.asset(
                            'assets/icons/calendar_active.png',
                            height: 30,
                            width: 30,
                          )
                              : Image.asset(
                            'assets/icons/calendar.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        controller.selectedScreen.value == 1
                            ? Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff86B560),
                                Color(0xff336F4A),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectedScreen.value = 2;
                            controller.loadBinding(2);
                          },
                          child: Image.asset(
                            'assets/icons/schedule.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        controller.selectedScreen.value == 2
                            ? Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff86B560),
                                Color(0xff336F4A),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectedScreen.value = 3;
                            controller.loadBinding(3);
                          },
                          child: Image.asset(
                            'assets/icons/person.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        controller.selectedScreen.value == 3
                            ? Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff86B560),
                                Color(0xff336F4A),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          height: 5,
                          width: 5,
                          margin: const EdgeInsets.only(top: 4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),),
        ),
      ),
      body: Obx(
        () => controller.screenList[controller.selectedScreen.value],
      ),
    );
  }
}
