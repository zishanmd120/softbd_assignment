import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_assignment/app/presentation/controllers/calendar_controller.dart';
import '../../../utils/constants/height_width.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';


class AddNewTimeline extends GetView<CalendarController> {
  const AddNewTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'নতুন যোগ করুন', showNotification: true, centerTitle: true, isBackButton: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              CustomTextFiledSection(
                title: 'অনুচ্ছেদ',
                textEditingController: controller.titleEditingController,
                maxLength: 45,
                hintText: 'অনুচ্ছেদ লিখুন',
                image: '',
                maxLines: 1,
                isPrefixIcon: false,
                isSuffixIcon: false,
              ),
              const SizedBox(height: 12,),
              CustomTextFiledSection(
                title: 'অনুচ্ছেদের বিভাগ',
                textEditingController: controller.titleDivEditingController,
                maxLength: 1,
                hintText: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                image: '',
                maxLines: 1,
                isPrefixIcon: false,
                isSuffixIcon: true,
              ),
              const SizedBox(height: 12,),
              CustomTextFiledSection(
                title: 'তারিখ ও সময়',
                textEditingController: controller.titleDateEditingController,
                maxLength: 1,
                hintText: 'নির্বাচন করুন',
                image: 'assets/icons/calendar_light.png',
                maxLines: 1,
                isPrefixIcon: true,
                isSuffixIcon: true,
              ),
              const SizedBox(height: 12,),
              CustomTextFiledSection(
                title: 'স্থান',
                textEditingController: controller.titlePlaceEditingController,
                maxLength: 1,
                hintText: 'নির্বাচন করুন',
                image: 'assets/icons/map.png',
                maxLines: 1,
                isPrefixIcon: true,
                isSuffixIcon: true,
              ),
              const SizedBox(height: 12,),
              CustomTextFiledSection(
                title: 'অনুচ্ছেদের বিবরণ',
                textEditingController: controller.titleDesEditingController,
                maxLength: 120,
                hintText: 'কার্যক্রমের বিবরণ লিখুন',
                image: '',
                maxLines: 6,
                isPrefixIcon: false,
                isSuffixIcon: false,
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (_){
                    return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/success.png', height: 100, width: 100,),
                          const SizedBox(height: 10,),
                          Text('নতুন অনুচ্ছেদ সংরক্ষন', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700,
                            fontSize: screenWidth(context) * 0.05,
                          ),),
                          const SizedBox(height: 5,),
                          const Text('আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff6A6A6A),),),
                          const SizedBox(height: 10,),
                          Container(
                            width: screenWidth(context) * 0.6,
                            padding: const EdgeInsets.symmetric(vertical: 11.0,),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff86B560),
                                  Color(0xff336F4A),
                                ],
                              ),
                            ),
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('আরও যোগ করুন',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 11.0,),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff86B560),
                        Color(0xff336F4A),
                      ],
                    ),
                  ),
                  child: const Text('সংরক্ষন করুন', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

