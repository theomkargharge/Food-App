import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:task/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:task/widget/simmer_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Container(
        color: Colors.orange.shade400,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              backgroundColor: Colors.orange.shade400,
              title: const Hero(
                tag: 'Feastify',
                child:  Text(
                  'Feastify',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            body: controller.isLoading.value
                ? ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: SimmerLoader(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: SimmerLoader(),
                              ),
                            );
                          })
                    ],
                  )
                : ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Select Month',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 60,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                            itemCount: 12,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextButton(
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize:
                                              controller.selectedIndex.value ==
                                                      index + 1
                                                  ? 25
                                                  : 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.updateIndex(val: index + 1);
                                        controller.getFoodData(
                                            month: index + 1);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: index < 11
                                        ? const VerticalDivider(
                                            color: Colors.white,
                                          )
                                        : Container(),
                                  )
                                ],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.orange.shade100, width: 1),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-1, 1),
                                spreadRadius: -1.0,
                                blurRadius: 1)
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: const AssetImage(
                                        'assets/boy.png',
                                      ),
                                      backgroundColor: Colors.orange.shade200,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      '${controller.userModel?.user?.fName?.toUpperCase() ?? ""} ')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 200,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade200,
                                      ),
                                      child: SfRadialGauge(
                                        axes: [
                                          RadialAxis(
                                            pointers: [
                                              RangePointer(
                                                value: controller.totalDummyFine
                                                            .value ==
                                                        0
                                                    ? (controller
                                                                .calculateTotalFine() /
                                                            1000) *
                                                        100
                                                    : controller
                                                        .totalDummyFine.value,
                                                width: 25,
                                                cornerStyle:
                                                    CornerStyle.bothFlat,
                                                gradient: const SweepGradient(
                                                    colors: [
                                                      Color(0xffffc434),
                                                      Color(0xffff8209),
                                                    ],
                                                    stops: [
                                                      0.1,
                                                      0.75
                                                    ]),
                                              )
                                            ],
                                            axisLineStyle: AxisLineStyle(
                                              thickness: 25,
                                              color: Colors.grey.shade300,
                                            ),
                                            startAngle: 5,
                                            endAngle: 5,
                                            showLabels: false,
                                            showAxisLine: false,
                                            showTicks: false,
                                            annotations: [
                                              GaugeAnnotation(
                                                widget: Text(
                                                  '₹ ${controller.calculateTotalFine()}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                                angle: 270,
                                                positionFactor: 0.1,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Monthly Total Fine',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.userModel?.reports?.length ?? 0,
                          itemBuilder: (context, index) {
                            var employeeData =
                                controller.userModel?.reports?[index];

                            var fine = 0;

                            if (employeeData?.optIns?.breakfast == "Pending") {
                              fine += 100;
                            }
                            if (employeeData?.optIns?.lunch == "Pending") {
                              fine += 100;
                            }
                            if (employeeData?.optIns?.dinner == "Pending") {
                              fine += 100;
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(-1, 1),
                                        spreadRadius: -1.0,
                                        blurRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 80,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text('BREAKFAST'),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                width: double.infinity,
                                                margin:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  color: employeeData?.optIns
                                                              ?.breakfast ==
                                                          "Delivered"
                                                      ? Colors.green.shade50
                                                      : employeeData?.optIns
                                                                  ?.breakfast ==
                                                              "Canceled"
                                                          ? Colors.red.shade50
                                                          : employeeData?.optIns
                                                                      ?.breakfast ==
                                                                  "Pending"
                                                              ? Colors
                                                                  .amber.shade50
                                                              : Colors.orange
                                                                  .shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  employeeData
                                                          ?.optIns?.breakfast ??
                                                      "Not Ordered",
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 50,
                                            child: VerticalDivider()),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 80,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text('LUNCH'),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                width: double.infinity,
                                                margin:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  color: employeeData?.optIns
                                                              ?.breakfast ==
                                                          "Delivered"
                                                      ? Colors.green.shade50
                                                      : employeeData?.optIns
                                                                  ?.breakfast ==
                                                              "Canceled"
                                                          ? Colors.red.shade50
                                                          : employeeData?.optIns
                                                                      ?.breakfast ==
                                                                  "Pending"
                                                              ? Colors
                                                                  .amber.shade50
                                                              : Colors.orange
                                                                  .shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  employeeData?.optIns?.lunch
                                                          ?.toUpperCase() ??
                                                      "Not Ordered",
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 50,
                                            child: VerticalDivider()),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: 80,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text('DINNER'),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                width: double.infinity,
                                                margin:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  color: employeeData?.optIns
                                                              ?.breakfast ==
                                                          "Delivered"
                                                      ? Colors.green.shade50
                                                      : employeeData?.optIns
                                                                  ?.breakfast ==
                                                              "Canceled"
                                                          ? Colors.red.shade50
                                                          : employeeData?.optIns
                                                                      ?.breakfast ==
                                                                  "Pending"
                                                              ? Colors
                                                                  .amber.shade50
                                                              : Colors.orange
                                                                  .shade50,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  employeeData?.optIns?.dinner
                                                          ?.toUpperCase() ??
                                                      "Not Ordered",
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade500,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.formateDate(
                                                inputDate: employeeData?.date ??
                                                    "0000-00-0"),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '₹ $fine',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}

