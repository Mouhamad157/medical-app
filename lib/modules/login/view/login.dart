import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math' as math;

import 'package:medical_app/core/colors/colors.dart';
import 'package:medical_app/core/components/components.dart';
import 'package:medical_app/core/utils/dimensions.dart';
import 'package:medical_app/modules/education_section/view/education_section_view.dart';
import 'package:medical_app/modules/login/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: controller.isPageLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : Form(
                  key: controller.formKey,
                  child: SizedBox(
                    width: ScreenDimensions.screenWidth(context),
                    height: ScreenDimensions.screenHeight(context),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height / 5, // ارتفاع الشكل المتموج
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // لون البداية
                                AppColors.primaryColor,
                                AppColors.white,
                                // لون النهاية
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateX(math
                                  .pi) // Rotate around the X-axis by 180 degrees
                              ..rotateY(math.pi),
                            // قلب العنصر بزاوية 180 درجة حول المحور الأفقي
                            child: Container(
                              height: size.height / 5, // ارتفاع الشكل المتموج
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // لون البداية
                                    AppColors.primaryColor,
                                    AppColors.white, // لون النهاية
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            height: size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(height: size.height / 7),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'سجل الدخول لحسابك',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height / 40),
                                TextFormField(
                                  controller: controller.userNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                    hintText: 'اسم المستخدم',
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: AppColors.black),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppColors.primaryColor,
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'الرجاء اختيار الاختصاص';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: size.height / 40),
                                TextFormField(
                                  controller: controller.passwordController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'كلمة السر',
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: AppColors.black),
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: AppColors.primaryColor,
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'الرجاء اختيار الاختصاص';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: size.height / 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownMenu(
                                      width: size.width * 0.31,
                                      selectedTrailingIcon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.red,
                                                    width: 10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              )),
                                      enableSearch: false,
                                      enableFilter: false,
                                      hintText: controller.agency,
                                      requestFocusOnTap: false,
                                      trailingIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      onSelected: (value) {
                                        controller.employeeChoice['agency_id'] =
                                            value;
                                        controller.update();
                                      },
                                      dropdownMenuEntries:
                                          controller.agencies.map(
                                        (e) {
                                          return DropdownMenuEntry(
                                              value: e.id, label: e.name);
                                        },
                                      ).toList(),
                                    ),
                                    DropdownMenu(
                                      width: size.width * 0.31,
                                      selectedTrailingIcon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.red,
                                                    width: 10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              )),
                                      enableSearch: false,
                                      enableFilter: false,
                                      hintText: controller.office,
                                      requestFocusOnTap: false,
                                      trailingIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      onSelected: (value) {
                                        controller.employeeChoice['office_id'] =
                                            value;
                                        controller.update();
                                      },
                                      dropdownMenuEntries:
                                          controller.offices.map(
                                        (e) {
                                          return DropdownMenuEntry(
                                              value: e.id, label: e.name);
                                        },
                                      ).toList(),
                                    ),
                                    DropdownMenu(
                                      width: size.width * 0.31,
                                      selectedTrailingIcon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.red,
                                                    width: 10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              )),
                                      enableSearch: false,
                                      enableFilter: false,
                                      hintText: controller.coverage,
                                      requestFocusOnTap: false,
                                      trailingIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      onSelected: (value) {
                                        controller
                                                .employeeChoice['coverage_id'] =
                                            value;
                                        controller.update();
                                      },
                                      dropdownMenuEntries:
                                          controller.coverages.map(
                                        (e) {
                                          return DropdownMenuEntry(
                                              value: e.id, label: e.name);
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownMenu(
                                      width: size.width * 0.47,
                                      selectedTrailingIcon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.red,
                                                    width: 10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              )),
                                      enableSearch: false,
                                      enableFilter: false,
                                      hintText: controller.access,
                                      requestFocusOnTap: false,
                                      trailingIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      onSelected: (value) {
                                        controller.employeeChoice['access_id'] =
                                            value;
                                        controller.update();
                                      },
                                      dropdownMenuEntries:
                                          controller.accesses.map(
                                        (e) {
                                          return DropdownMenuEntry(
                                              value: e.id, label: e.name);
                                        },
                                      ).toList(),
                                    ),
                                    DropdownMenu(
                                      width: size.width * 0.47,
                                      selectedTrailingIcon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.red,
                                                    width: 10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              )),
                                      enableSearch: false,
                                      enableFilter: false,
                                      hintText: controller.medicalCenter,
                                      requestFocusOnTap: false,
                                      trailingIcon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.primaryColor,
                                          size:
                                              ScreenDimensions.widthPercentage(
                                                  context, 3)),
                                      onSelected: (value) {
                                        controller.employeeChoice[
                                            'medical_center_id'] = value;
                                        controller.update();
                                      },
                                      dropdownMenuEntries:
                                          controller.medicalCenters.map(
                                        (e) {
                                          return DropdownMenuEntry(
                                              value: e.id, label: e.name);
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                DropdownMenu(
                                  width: size.width * 0.94,
                                  selectedTrailingIcon: Icon(
                                      Icons.keyboard_arrow_up_outlined,
                                      color: AppColors.primaryColor,
                                      size: ScreenDimensions.widthPercentage(
                                          context, 3)),
                                  inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.red, width: 10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                        ),
                                      )),
                                  enableSearch: false,
                                  enableFilter: false,
                                  hintText: controller.partner,
                                  requestFocusOnTap: false,
                                  trailingIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.primaryColor,
                                      size: ScreenDimensions.widthPercentage(
                                          context, 3)),
                                  onSelected: (value) {
                                    controller.employeeChoice['partner_id'] =
                                        value;
                                    controller.update();
                                  },
                                  dropdownMenuEntries: controller.partners.map(
                                    (e) {
                                      return DropdownMenuEntry(
                                          value: e.id, label: e.name);
                                    },
                                  ).toList(),
                                ),
                                SizedBox(height: size.height / 20),
                                controller.isLoading
                                    ? CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            fixedSize: const Size(150, 50),
                                          ),
                                          onPressed: () {
                                            // if (controller.specialization == 'تثقيف') {
                                            //   Get.to(const EducationSection());
                                            // }
                                            if (!(controller
                                                .formKey.currentState!
                                                .validate())) {
                                              return;
                                            }
                                            if (controller.employeeChoice['partner_id'] == null ||
                                                controller.employeeChoice[
                                                        'partner_id'] ==
                                                    null ||
                                                controller.employeeChoice[
                                                        'partner_id'] ==
                                                    null ||
                                                controller.employeeChoice[
                                                        'partner_id'] ==
                                                    null ||
                                                controller.employeeChoice[
                                                        'partner_id'] ==
                                                    null ||
                                                controller.employeeChoice[
                                                        'partner_id'] ==
                                                    null) {
                                              Get.snackbar('تحذير',
                                                  'الرجاء تعبئة البيانات بالكامل');
                                            } else {
                                              controller.login();
                                            }
                                          },
                                          child: const Text(
                                            'موافق',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
