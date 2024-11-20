import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors/colors.dart';
import '../../../core/texts/words.dart';
import '../../../core/utils/dimensions.dart';
import '../controller/education_section_controller.dart';

import '../../../core/components/components.dart';

class EducationSection extends GetView<EducationSectionController> {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EducationSectionController());
    return SafeArea(
      child: GetBuilder<EducationSectionController>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: AppText.subtitleBold(
              text: AppWord.educationSection,
              color: AppColors.white,
            ),
            centerTitle: true,
            actions: [
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ScreenDimensions.widthPercentage(context, 2)),
                    child: Icon(
                      Icons.view_headline_sharp,
                      color: AppColors.white,
                    ),
                  ),
                );
              })
            ],
            backgroundColor: AppColors.primaryColor,
            shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(ScreenDimensions.radius(context, 10)),
              ),
            ),
          ),
          endDrawer: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: ScreenDimensions.widthPercentage(context, 33),
              padding: EdgeInsets.symmetric(
                  vertical: ScreenDimensions.heightPercentage(context, 3)),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ScreenDimensions.radius(context, 5),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenDimensions.heightPercentage(
                                      context, 1)),
                              child: AppText.subtitleBold(
                                text: 'full name',
                                textAlign: TextAlign.right,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AppText.smallBold(
                              text: 'bio',
                              maxLines: 3,
                              color: AppColors.white,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                ScreenDimensions.widthPercentage(context, 2)),
                        child: Icon(
                          Icons.person_outline_sharp,
                          size: ScreenDimensions.widthPercentage(context, 4),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            ScreenDimensions.heightPercentage(context, 1)),
                    child: Divider(
                      color: AppColors.white,
                      endIndent: ScreenDimensions.widthPercentage(context, 2),
                      indent: ScreenDimensions.widthPercentage(context, 2),
                    ),
                  ),
                  DrawerLisTile(
                    onTap: () {
                      Get.back();
                      controller.currentIndex = 0;
                      controller.update();
                    },
                    title: AppWord.home,
                    icon: Icons.home_outlined,
                  ),
                  DrawerLisTile(
                    onTap: () {
                      Get.back();
                      controller.currentIndex = 1;
                      controller.update();
                    },
                    title: AppWord.saveSessionData,
                    icon: Icons.save_as_sharp,
                  ),
                  DrawerLisTile(
                    onTap: () {
                      Get.back();
                      controller.currentIndex = 2;
                      controller.update();
                    },
                    title: AppWord.sendAdvice,
                    icon: Icons.send,
                  ),
                ],
              ),
            ),
          ),
          drawerEdgeDragWidth: ScreenDimensions.widthPercentage(context, 33),
          body: Container(
            width: ScreenDimensions.screenWidth(context),
            color: AppColors.primaryColor,
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          ScreenDimensions.radius(context, 10))),
                ),
                child: controller.body()),
          ),
        );
      }),
    );
  }
}

class SaveSessionData extends GetView<EducationSectionController> {
  const SaveSessionData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationSectionController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
            child: AppText.subtitleBold(text: AppWord.recordSession),
          ),
          SizedBox(
            width: ScreenDimensions.widthPercentage(context, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppDropDownMenu(
                  content: AppWord.agency,
                  width: ScreenDimensions.widthPercentage(context, 25),
                  items: [
                    PopupMenuItem(
                      child: SizedBox(
                          width: ScreenDimensions.widthPercentage(context, 30),
                          child: AppText.smallBold(
                            text: 'asdlkasdkl',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
                AppDropDownMenu(
                  content: AppWord.office,
                  width: ScreenDimensions.widthPercentage(context, 25),
                  items: [
                    PopupMenuItem(
                      child: SizedBox(
                          width: ScreenDimensions.widthPercentage(context, 30),
                          child: AppText.smallBold(
                            text: 'asdlkasdkl',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppTextFormField(
              maxLines: 2,
              hintText: AppWord.partner,
              controller: controller.partnerController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppTextFormField(
              maxLines: 2,
              hintText: AppWord.activity,
              controller: controller.activityController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: SizedBox(
              width: ScreenDimensions.widthPercentage(context, 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          controller.dateController.text =
                              '${date.year} / ${date.month} / ${date.day}';
                          controller.update();
                        }
                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: AppColors.primaryColor,
                        size: ScreenDimensions.widthPercentage(context, 7),
                      )),
                  AppTextFormField(
                    width: ScreenDimensions.widthPercentage(context, 40),
                    maxLines: 2,
                    enabled: false,
                    hintText: AppWord.sessionDate,
                    controller: controller.dateController,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppButton(
              buttonName: AppWord.next,
              onTap: () {
                controller.currentIndex = 3;
                controller.update();
              },
            ),
          ),
        ],
      );
    });
  }
}

class SaveSessionData2 extends GetView<EducationSectionController> {
  const SaveSessionData2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationSectionController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
            child: AppText.subtitleBold(text: AppWord.recordSession),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppDropDownMenu(
              content: AppWord.program,
              width: ScreenDimensions.widthPercentage(context, 60),
              items: [
                PopupMenuItem(
                  child: SizedBox(
                      child: AppText.smallBold(
                    text: 'asdlkasdkl',
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppDropDownMenu(
              content: AppWord.programClass,
              width: ScreenDimensions.widthPercentage(context, 60),
              items: [
                PopupMenuItem(
                  child: SizedBox(
                      child: AppText.smallBold(
                    text: 'asdlkasdkl',
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppDropDownMenu(
              content: AppWord.accessMethod,
              width: ScreenDimensions.widthPercentage(context, 60),
              items: [
                PopupMenuItem(
                  child: SizedBox(
                      child: AppText.smallBold(
                    text: 'asdlkasdkl',
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: SizedBox(
              width: ScreenDimensions.widthPercentage(context, 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppDropDownMenu(
                    content: AppWord.coverLevel,
                    items: [
                      PopupMenuItem(
                        child: SizedBox(
                            width:
                                ScreenDimensions.widthPercentage(context, 30),
                            child: AppText.smallBold(
                              text: 'asdlkasdkl',
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                  AppDropDownMenu(
                    content: AppWord.subjectName,
                    items: [
                      PopupMenuItem(
                        child: SizedBox(
                            width:
                                ScreenDimensions.widthPercentage(context, 30),
                            child: AppText.smallBold(
                              text: 'asdlkasdkl',
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: SizedBox(
              width: ScreenDimensions.widthPercentage(context, 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    buttonName: AppWord.next,
                    onTap: () {
                      controller.currentIndex = 4;
                      controller.update();
                    },
                    width: ScreenDimensions.widthPercentage(context, 25),
                  ),
                  AppButton(
                    buttonName: AppWord.previous,
                    onTap: () {
                      controller.currentIndex = 1;
                      controller.update();
                    },
                    width: ScreenDimensions.widthPercentage(context, 25),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class SaveSessionData3 extends GetView<EducationSectionController> {
  const SaveSessionData3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationSectionController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
            child: AppText.subtitleBold(text: AppWord.recordSession),
          ),
          Padding(
            padding:
                EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
            child: AppText.subtitle(text: AppWord.address),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppTextFormField(
              hintText: AppWord.province,
              controller: controller.provinceController,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppTextFormField(
              hintText: AppWord.area,
              controller: controller.areaController,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            child: AppTextFormField(
              hintText: AppWord.place,
              controller: controller.placeController,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(
            width: ScreenDimensions.widthPercentage(context, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  buttonName: AppWord.next,
                  width: ScreenDimensions.widthPercentage(context, 25),
                  onTap: () {
                    controller.currentIndex = 5;
                    controller.update();
                  },
                ),
                AppButton(
                  buttonName: AppWord.previous,
                  width: ScreenDimensions.widthPercentage(context, 25),
                  onTap: () {
                    controller.currentIndex = 3;
                    controller.update();
                  },
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}

class SaveSessionData4 extends GetView<EducationSectionController> {
  const SaveSessionData4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationSectionController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding:
                EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
            child: AppText.subtitleBold(text: AppWord.recordSession),
          ),
          Container(
            width: ScreenDimensions.screenWidth(context),
            margin: EdgeInsets.symmetric(
                horizontal: ScreenDimensions.widthPercentage(context, 4)),
            height: ScreenDimensions.heightPercentage(context, 47.3),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius:
                  BorderRadius.circular(ScreenDimensions.radius(context, 2)),
            ),
            child: Column(
              children: [
                Container(
                  width: ScreenDimensions.screenWidth(context),
                  height: ScreenDimensions.heightPercentage(context, 7),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            ScreenDimensions.radius(context, 2)),
                        topLeft: Radius.circular(
                            ScreenDimensions.radius(context, 2)),
                      )),
                  alignment: Alignment.center,
                  child: AppText.subtitleBold(
                    text: AppWord.attendance,
                    color: AppColors.white,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.newBeneficiariesController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smallBold(text: AppWord.newBeneficiaries),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.femaleAdultNumberController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smallBold(
                          text: AppWord.adultFemaleAttendance),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.specialNeedsController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smallBold(text: AppWord.specialNeeds),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.maleAdultNumberController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child:
                          AppText.smallBold(text: AppWord.adultMaleAttendance),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.beneficiariesTypeController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smallBold(text: AppWord.beneficiariesType),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.femaleChildNumberController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smallBold(text: AppWord.femaleAttendance),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  ScreenDimensions.radius(context, 2)))),
                      alignment: Alignment.center,
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      alignment: Alignment.center,
                      child: TextFormField(
                          controller: controller.maleChildNumberController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          )),
                    ),
                    Container(
                      width: ScreenDimensions.widthPercentage(context, 22.94),
                      height: ScreenDimensions.heightPercentage(context, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                  ScreenDimensions.radius(context, 2)))),
                      alignment: Alignment.center,
                      child: AppText.smallBold(text: AppWord.maleAttendance),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.heightPercentage(context, 4)),
            child: SizedBox(
                width: ScreenDimensions.widthPercentage(context, 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      buttonName: AppWord.save,
                      onTap: () {
                        Get.dialog(Material(
                          color: Colors.transparent,
                          child: Container(
                            width: ScreenDimensions.widthPercentage(context, 40),
                            height: ScreenDimensions.heightPercentage(context, 25),
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenDimensions.heightPercentage(context, 50),
                                vertical: ScreenDimensions.heightPercentage(context, 35)),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                    ScreenDimensions.radius(context, 2))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppText.subtitleBold(
                                    text: AppWord.sessionDataSavedSuccessfully),
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.primaryColor,
                                ),
                                AppText.subtitle(
                                    text: AppWord
                                        .doYouWantToRecordTheAttendanceData),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppButton(
                                      buttonName: AppWord.yes,
                                      width: ScreenDimensions.widthPercentage(
                                          context, 10),
                                      height: ScreenDimensions.heightPercentage(
                                          context, 5),
                                      onTap: (){},
                                    ),
                                    AppButton(
                                      buttonName: AppWord.ignore,
                                      width: ScreenDimensions.widthPercentage(
                                          context, 10),
                                      height: ScreenDimensions.heightPercentage(
                                          context, 5),
                                      onTap:() {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                      },
                      width: ScreenDimensions.widthPercentage(context, 30),
                    ),
                    AppButton(
                      buttonName: AppWord.previous,
                      onTap: () {
                        controller.currentIndex = 4;
                        controller.update();
                      },
                      width: ScreenDimensions.widthPercentage(context, 30),
                    ),
                  ],
                )),
          ),
        ],
      );
    });
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.all(ScreenDimensions.heightPercentage(context, 3)),
          child: AppText.subtitleBold(text: AppWord.home),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenDimensions.widthPercentage(context, 4),
              vertical: ScreenDimensions.heightPercentage(context, 2)),
          child: Align(
            alignment: Alignment.centerRight,
            child: AppText.subtitle(text: AppWord.latestAdvice),
          ),
        ),
        SizedBox(
          width: ScreenDimensions.widthPercentage(context, 80),
          height: ScreenDimensions.heightPercentage(context, 70),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: ScreenDimensions.heightPercentage(context, 20),
                  width: ScreenDimensions.widthPercentage(context, 80),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenDimensions.widthPercentage(context, 1),
                      vertical: ScreenDimensions.heightPercentage(context, 1)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenDimensions.widthPercentage(context, 3)),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(
                          ScreenDimensions.radius(context, 2))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDimensions.heightPercentage(
                                  context, 2)),
                          child: AppText.subtitleBold(
                            text: 'title',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppText.subtitle(
                          text: 'script',
                          maxLines: 3,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
