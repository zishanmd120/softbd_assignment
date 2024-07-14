import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_assignment/app/presentation/widgets/helpers.dart';
import '../../../utils/constants/height_width.dart';
import '../../controllers/home_controllers.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_percent_indicator.dart';
import '../../widgets/custom_appbar.dart';


class HomeScreen extends GetView<HomeController>{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'Flutter Task', showNotification: true, centerTitle: false, isBackButton: false,),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0, top: 12.0, bottom: 12.0,),
                              child: Image.asset('assets/images/person.png'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        flex: 4,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('মোঃ মোহাইমেনুল রেজা', style: TextStyle(
                                fontSize: screenWidth(context) * 0.05,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("সফটবিডি লিমিটেড",  style: TextStyle(fontSize: screenWidth(context) * 0.038, height: 1.7,),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icons/map.png', height: 20, width: 20,),
                                  const SizedBox(width: 4,),
                                  Text("ঢাকা", style: TextStyle(fontSize: screenWidth(context) * 0.038,),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PercentIndicator(
                            percent: controller.dateProgress / 100,
                            lineWidth: 10.0,
                            radius: 120.0,
                            backgroundColor: Colors.grey.shade200,
                            progressColor: Colors.green,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                width: screenWidth(context) * 0.18,
                                alignment: Alignment.center,
                                child: Text(
                                  controller.getTotalTimeElapsed(controller.formattedList),
                                  style: TextStyle(fontSize: screenWidth(context) * 0.033, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("সময় অতিবাহিত",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth(context) * 0.045,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    flex: 6,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("মেয়াদকাল",
                              style: TextStyle(
                                fontSize: screenWidth(context) * 0.043, fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.date_range, size: screenWidth(context) * 0.04,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text("১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০",
                                    style: TextStyle(
                                      fontSize: screenWidth(context) * 0.03,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text("আরও বাকি",
                              style: TextStyle(
                                // fontSize: 16.0,
                                fontSize: screenWidth(context) * 0.043,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CountDownDate(firstValue: controller.formattedList[0], secondValue: controller.formattedList[1], label: 'বছর',),
                                CountDownDate(firstValue: controller.formattedList[2], secondValue: controller.formattedList[3], label: 'মাস',),
                                CountDownDate(firstValue: controller.formattedList[4], secondValue: controller.formattedList[5], label: 'দিন',),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: screenWidth(context) * 0.33,
                  childAspectRatio: 130 / 165,
                ),
                itemCount: 6,
                itemBuilder: (context, index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 75,
                        width: 72,
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset('assets/images/${index + 1}.png'),
                      ),
                      const SizedBox(height: 8,),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("মেনু নং\n০০০০${Helpers().convertEnglishNumberToBengali(index+1)}", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: screenWidth(context) * 0.035, fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}

class CountDownDate extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String label;
  const CountDownDate({super.key, required this.firstValue, required this.secondValue, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3,),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red,),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(Helpers().convertEnglishNumberToBengali(firstValue),
                style: TextStyle(
                  fontSize: screenWidth(context) * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3,),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red,),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(Helpers().convertEnglishNumberToBengali(secondValue),
                style: TextStyle(
                  fontSize: screenWidth(context) * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Text(label, style: TextStyle(fontSize: screenWidth(context) * 0.034, fontWeight: FontWeight.w500),),
      ],
    );
  }
}


