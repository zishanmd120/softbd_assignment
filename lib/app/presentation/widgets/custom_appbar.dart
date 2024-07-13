import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar CustomAppBar({
  required BuildContext context,
  required String title,
  required bool showNotification,
  required bool centerTitle,
  required bool isBackButton,
}) {
  return AppBar(
    leading: isBackButton
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          )
        : Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
    title: centerTitle
        ? Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: Get.width * 0.045,),)
        : Row(
            children: [
              Image.asset(
                'assets/images/demo.png',
                fit: BoxFit.contain,
                height: 35,
                width: 35,
              ),
              const SizedBox(width: 10,),
              Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: Get.width * 0.045,),),
            ],
          ),
    centerTitle: centerTitle,
    actions: [
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.05),
        ),
        child: showNotification
            ? IconButton(
                onPressed: () {},
                icon: Stack(
                  children: [
                    Image.asset('assets/icons/notification.png'),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        height: 8,
                        width: 8,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    ],
  );
}
