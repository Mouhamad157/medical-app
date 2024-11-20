import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/colors/colors.dart';
import 'package:medical_app/core/images/app_images.dart';
import 'package:medical_app/core/texts/words.dart';
import 'package:medical_app/core/utils/app_fonts.dart';
import 'package:medical_app/core/utils/dimensions.dart';
import 'package:medical_app/modules/medicines/view/medicines_view.dart';
import 'package:medical_app/modules/nutrition_section/view/nutrition_section_view.dart';
import 'package:medical_app/modules/record/controller/record_controller.dart';
import 'dart:core';
import '../../../core/components/components.dart';

class RecordScreen extends GetView<RecordController> {
  const RecordScreen({super.key, required this.medicalRecordId});

  final int medicalRecordId;

  @override
  Widget build(BuildContext context) {
    Get.put(RecordController());
    controller.medicalRecordId = medicalRecordId;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            AppWord.patientRecord,
            style: TextStyle(
                fontSize: AppFonts.subTitleFont(context),
                color: AppColors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: ScreenDimensions.widthPercentage(context, 2),
              ),
            ),
          ),
        ),
        body: GetBuilder<RecordController>(builder: (_) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    width: ScreenDimensions.screenWidth(context),
                    height: ScreenDimensions.screenHeight(context),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: ScreenDimensions.widthPercentage(
                                  context, 60),
                              height: ScreenDimensions.heightPercentage(
                                  context, 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ScreenDimensions.radius(context, 1)),
                                  border: Border.all(
                                      color: AppColors.primaryColor)),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(AppWord.patientsMedicalHistory,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFonts.smallTitleFont(
                                              context))),
                                  Divider(
                                    color: AppColors.primaryColor,
                                  ).paddingSymmetric(
                                      horizontal:
                                          ScreenDimensions.widthPercentage(
                                              context, 2)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MedicalHistoryCard(
                                        title: AppWord.nutritionSection,
                                        onTap: (){
                                          Get.to(const NutritionSection(),arguments: {
                                            'RecordId' : controller.medicalRecordId
                                          });
                                        },
                                        imagePath: AppImages.food,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenDimensions.widthPercentage(
                                  context, 25),
                              height: ScreenDimensions.heightPercentage(
                                  context, 40),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ScreenDimensions.radius(context, 1)),
                                  border: Border.all(
                                      color: AppColors.primaryColor)),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(AppWord.info,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFonts.smallTitleFont(
                                              context))),
                                  Divider(
                                    color: AppColors.primaryColor,
                                  ).paddingSymmetric(
                                      horizontal:
                                          ScreenDimensions.widthPercentage(
                                              context, 2)),
                                  InfoCard(
                                      title: AppWord.id,
                                      subtitle: controller.recordModel.id.toString()??''),
                                  InfoCard(
                                      title: AppWord.name,
                                      subtitle:
                                          controller.recordModel.fullName??''),
                                  InfoCard(
                                      title: AppWord.age,
                                      subtitle: controller.recordModel.age
                                          .toString()??''),
                                  InfoCard(
                                      title: AppWord.gender,
                                      subtitle:
                                          controller.recordModel.gender=='female'||controller.recordModel.gender=='Female'?'أنثى':'ذكر'),
                                  InfoCard(
                                      title: AppWord.specialNeeds,
                                      subtitle: controller.recordModel
                                                  .specialNeeds ==
                                              0
                                          ? AppWord.no
                                          : AppWord.yes??''),
                                  InfoCard(
                                      title: AppWord.address,
                                      subtitle:
                                          controller.recordModel.address??''),
                                  InfoCard(
                                      title: AppWord.phone,
                                      subtitle: controller
                                          .recordModel.phoneNumber??''),
                                ],
                              ),
                            ),
                          ],
                        ).paddingOnly(
                            bottom: ScreenDimensions.heightPercentage(context, 3)),
                        Container(
                          alignment: Alignment.topCenter,
                          width: ScreenDimensions.widthPercentage(context, 80),
                          height: ScreenDimensions.heightPercentage(
                              context, 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor,
                                width: ScreenDimensions.widthPercentage(
                                    context, 0.1)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  ScreenDimensions.radius(context, 1)),
                              topRight: Radius.circular(
                                  ScreenDimensions.radius(context, 1)),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TitleCard(
                                    title: AppWord.medicine,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        ScreenDimensions.radius(context, 1),
                                      ),
                                    ),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 12),
                                  ),
                                  TitleCard(
                                    title: AppWord.activity,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 12),
                                  ),
                                  TitleCard(
                                    title: AppWord.diagnosis,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 34),
                                  ),
                                  TitleCard(
                                    title: AppWord.visitDate,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 6.75),
                                  ),
                                  TitleCard(
                                    title: AppWord.recordId,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 10),
                                  ),
                                  TitleCard(
                                    title: AppWord.visit,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            ScreenDimensions.radius(
                                                context, 1))),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 5),
                                  ),
                                ],
                              ),
                              !controller.haveDoctorVisits
                                  ? Center(
                                      child: Text(
                                      AppWord
                                          .thisPatientDoseNotHaveVisitRecord,
                                      style: TextStyle(
                                          fontSize: AppFonts.subTitleFont(
                                              context)),
                                    ))
                                  : SizedBox(
                                      width: ScreenDimensions.widthPercentage(context, 80),
                                      height: ScreenDimensions.heightPercentage(context, 34.4),
                                      child: ListView.builder(
                                        itemCount: controller.visitsModel.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              SizedBox(
                                                width: ScreenDimensions.widthPercentage(
                                                        context, 12),
                                                child: GestureDetector(
                                                  onTap: () async{
                                                    await controller.getVisitMedicine(visitId: controller.visitsModel[index].id).then((value){
                                                      if(controller.isVisitMedicineEmpty){
                                                        return;
                                                      }else{
                                                        Get.dialog(
                                                          GetBuilder<RecordController>(
                                                              builder: (_) {
                                                                return Material(
                                                                  color: Colors.transparent,
                                                                  child: Container(
                                                                    width: ScreenDimensions.widthPercentage(context,50),
                                                                    height: ScreenDimensions.heightPercentage(context, 50),
                                                                    margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                        ScreenDimensions.widthPercentage(context, 30),
                                                                        vertical: ScreenDimensions.heightPercentage(context, 20)),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1)),
                                                                        border: Border.all(
                                                                            color: AppColors.primaryColor),
                                                                        color: AppColors.white),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Container(
                                                                          width: ScreenDimensions.screenWidth(context),
                                                                          height: ScreenDimensions.heightPercentage(context,5),
                                                                          alignment: Alignment.center,
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.primaryColor,
                                                                              borderRadius: BorderRadius.only(
                                                                                topRight:
                                                                                Radius.circular(ScreenDimensions.radius(context, 1)),
                                                                                topLeft:
                                                                                Radius.circular(
                                                                                  ScreenDimensions.radius(context, 1),
                                                                                ),
                                                                              )),
                                                                          child:
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              AppText.subtitleBold(
                                                                                text:controller.visitsModel[index].id.toString(),
                                                                                color:AppColors.white,
                                                                              ),
                                                                              AppText.subtitleBold(
                                                                                text: ' : ',
                                                                                color: AppColors.white,
                                                                              ),
                                                                              AppText
                                                                                  .subtitleBold(
                                                                                text:
                                                                                AppWord.orderedMedicine,
                                                                                color:
                                                                                AppColors.white,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: ScreenDimensions.widthPercentage(
                                                                              context,
                                                                              30),
                                                                          height: ScreenDimensions.heightPercentage(
                                                                              context,
                                                                              40),
                                                                          margin: EdgeInsets.symmetric(
                                                                              vertical: ScreenDimensions.heightPercentage(
                                                                                  context,
                                                                                  2)),
                                                                          decoration:BoxDecoration(
                                                                            border: Border.all(
                                                                                color:
                                                                                AppColors.silver,
                                                                                width: ScreenDimensions.widthPercentage(context, 0.1)),
                                                                            borderRadius:
                                                                            BorderRadius.only(
                                                                              topLeft: Radius.circular(ScreenDimensions.radius(
                                                                                  context,
                                                                                  1)),
                                                                              topRight: Radius.circular(ScreenDimensions.radius(
                                                                                  context,
                                                                                  1)),
                                                                            ),
                                                                          ),
                                                                          child: Column(
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    width: ScreenDimensions.widthPercentage(context, 14.8),
                                                                                    height: ScreenDimensions.heightPercentage(context, 5),
                                                                                    alignment: Alignment.center,
                                                                                    decoration: BoxDecoration(
                                                                                      color: AppColors.silver,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        topLeft: Radius.circular(ScreenDimensions.radius(context, 1)),
                                                                                      ),
                                                                                    ),
                                                                                    child: AppText.smallBold(text: AppWord.quantity),
                                                                                  ),
                                                                                  Container(
                                                                                    width: ScreenDimensions.widthPercentage(context, 15),
                                                                                    height: ScreenDimensions.heightPercentage(context, 5),
                                                                                    alignment: Alignment.center,
                                                                                    decoration: BoxDecoration(
                                                                                      color: AppColors.silver,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        topRight: Radius.circular(ScreenDimensions.radius(context, 1)),
                                                                                      ),
                                                                                    ),
                                                                                    child: AppText.smallBold(text: AppWord.id),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                width:
                                                                                ScreenDimensions.widthPercentage(context, 30),
                                                                                height:
                                                                                ScreenDimensions.heightPercentage(context, 30),
                                                                                child:
                                                                                ListView.separated(
                                                                                  itemCount: controller.medicines.length,
                                                                                  itemBuilder: (BuildContext context, int index) {
                                                                                    return SizedBox(
                                                                                      width: ScreenDimensions.widthPercentage(context, 30),
                                                                                      height: ScreenDimensions.heightPercentage(context, 7),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          SizedBox(
                                                                                              width: ScreenDimensions.widthPercentage(context, 14.7),
                                                                                              child: AppText.smallBold(
                                                                                                text: controller.medicines[index]['quantity'].toString(),
                                                                                                textAlign: TextAlign.center,
                                                                                              )),
                                                                                          Container(
                                                                                            height: ScreenDimensions.heightPercentage(context, 100),
                                                                                            width: ScreenDimensions.widthPercentage(context, 0.1),
                                                                                            color: AppColors.silver,
                                                                                          ),
                                                                                          SizedBox(
                                                                                              width: ScreenDimensions.widthPercentage(context, 14.7),
                                                                                              child: AppText.smallBold(
                                                                                                text: controller.medicines[index]['id'].toString(),
                                                                                                textAlign: TextAlign.center,
                                                                                              )),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  separatorBuilder: (BuildContext context, int index) {
                                                                                    return Divider(
                                                                                      color: AppColors.silver,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width: ScreenDimensions.widthPercentage(
                                                                                context,
                                                                                10),
                                                                            height: ScreenDimensions.heightPercentage(
                                                                                context,
                                                                                5),
                                                                            decoration: BoxDecoration(
                                                                                color:
                                                                                AppColors.primaryColor,
                                                                                borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1))),
                                                                            alignment:
                                                                            Alignment.center,
                                                                            child: AppText
                                                                                .smallBold(
                                                                              text:
                                                                              'اغلاق',
                                                                              color:
                                                                              AppColors.white,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                        );
                                                      }
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                            context, 5),
                                                    child: Icon(
                                                      Icons.ios_share,
                                                      color: Colors.green,
                                                      size: ScreenDimensions
                                                          .widthPercentage(
                                                              context, 3),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions.widthPercentage(context, 12),
                                                child: Text(
                                                  controller.visitsModel[index].activity!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: AppFonts.smallTitleFont(context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions.widthPercentage(context, 34),
                                                child: Text(
                                                  controller
                                                      .visitsModel[index]
                                                      .result,
                                                  maxLines: 2,
                                                  textAlign:
                                                      TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: AppFonts
                                                        .smallTitleFont(
                                                            context),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 6.75),
                                                child: Text(
                                                  controller
                                                      .visitsModel[index]
                                                      .date,
                                                  maxLines: 2,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: AppFonts
                                                        .smallTitleFont(
                                                            context),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 10),
                                                child: Text(
                                                  controller
                                                      .visitsModel[index]
                                                      .medicalRecordId
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: AppFonts
                                                        .smallTitleFont(
                                                            context),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 5),
                                                child: Text(
                                                  controller
                                                      .visitsModel[index].id
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: AppFonts
                                                        .smallTitleFont(
                                                            context),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).paddingSymmetric(
                                              vertical: ScreenDimensions.widthPercentage(
                                                      context, 1));
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(
                      horizontal: ScreenDimensions.widthPercentage(context, 1),
                      vertical: ScreenDimensions.heightPercentage(context, 4)),
                );
        }),
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.dialog(
              GetBuilder<RecordController>(builder: (_) {
                return Material(
                  color: Colors.transparent,
                  child: Container(
                    width: ScreenDimensions.widthPercentage(context, 50),
                    height: ScreenDimensions.heightPercentage(context, 30),
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            ScreenDimensions.widthPercentage(context, 20),
                        vertical:
                            ScreenDimensions.heightPercentage(context, 15)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ScreenDimensions.radius(context, 1)),
                        border: Border.all(color: AppColors.primaryColor),
                        color: AppColors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenDimensions.screenWidth(context),
                          height: ScreenDimensions.heightPercentage(context, 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    ScreenDimensions.radius(context, 1)),
                                topLeft: Radius.circular(
                                  ScreenDimensions.radius(context, 1),
                                ),
                              )),
                          child: Text(AppWord.addVisit,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFonts.subTitleFont(context))),
                        ),
                        AddAppointmentFields(
                          controller: controller.resultController,
                          title: AppWord.diagnosis,
                          fieldWidth:
                              ScreenDimensions.widthPercentage(context, 30),
                          maxLines: 2,
                          cardWidth:
                              ScreenDimensions.widthPercentage(context, 80),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          ScreenDimensions.widthPercentage(
                                              context, 2)),
                                  child: PopupMenuButton(
                                    elevation: 0.1,
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          onTap: () {
                                            controller.activity =
                                                AppWord.healthCare;
                                            controller.update();
                                          },
                                          value: AppWord.healthCare,
                                          child: Center(
                                            child: Text(
                                              AppWord.healthCare,
                                              style: TextStyle(
                                                fontSize:
                                                    AppFonts.smallTitleFont(
                                                        context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            controller.activity =
                                                AppWord.healthEducation;
                                            controller.update();
                                          },
                                          value: AppWord.healthEducation,
                                          child: Center(
                                            child: Text(
                                              AppWord.healthEducation,
                                              style: TextStyle(
                                                fontSize:
                                                    AppFonts.smallTitleFont(
                                                        context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            controller.activity = '${AppWord.healthEducation} و ${AppWord.healthCare}';
                                            controller.update();
                                          },
                                          value: '${AppWord.healthEducation} و ${AppWord.healthCare}',
                                          child: Center(
                                            child: Text(
                                              '${AppWord.healthEducation} و ${AppWord.healthCare}',
                                              style: TextStyle(
                                                fontSize: AppFonts.smallTitleFont(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ];
                                    },
                                    child: Container(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 15),
                                      height: ScreenDimensions.heightPercentage(
                                          context, 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                        borderRadius: BorderRadius.circular(
                                          ScreenDimensions.widthPercentage(
                                              context, 0.3),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: AppColors.primaryColor,
                                              size: ScreenDimensions
                                                  .heightPercentage(
                                                      context, 3)),
                                          SizedBox(
                                            width: ScreenDimensions.widthPercentage(context, 8),
                                            child: Text(
                                              controller.activity,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: AppFonts.smallTitleFont(
                                                    context),
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ).paddingSymmetric(
                                          horizontal:
                                              ScreenDimensions.widthPercentage(
                                                  context, 2)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          ScreenDimensions.widthPercentage(
                                              context, 2)),
                                  child: Text(
                                    AppWord.activity,
                                    style: TextStyle(
                                        fontSize:
                                            AppFonts.subTitleFont(context)),
                                  ),
                                ),
                              ],
                            ),
                            AddAppointmentFields(
                              controller: controller.idController,
                              title: AppWord.id,
                              readOnly: true,
                              hintText: medicalRecordId.toString(),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ScreenDimensions.widthPercentage(context, 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                          '${date.year}-${date.month}-${date.day}';
                                      controller.update();
                                    }
                                  },
                                  child: Icon(
                                    Icons.date_range,
                                    color: AppColors.primaryColor,
                                    size: ScreenDimensions.widthPercentage(
                                        context, 3),
                                  )),
                              AddAppointmentFields(
                                controller: controller.dateController,
                                title: AppWord.visitDate,
                                readOnly: true,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: ScreenDimensions.widthPercentage(context, 50),
                          height: ScreenDimensions.heightPercentage(context, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.dateController.clear();
                                  controller.idController.clear();
                                  controller.resultController.clear();
                                  controller.activity = AppWord.activity;
                                  Get.back();
                                  controller.update();
                                },
                                child: Container(
                                  width: ScreenDimensions.widthPercentage(
                                      context, 15),
                                  height: ScreenDimensions.heightPercentage(
                                      context, 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        ScreenDimensions.radius(context, 0.5)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppWord.cancel,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize:
                                          AppFonts.smallTitleFont(context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Get.dialog(Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.primaryColor),
                                  ));
                                  await controller.createVisit();
                                },
                                child: Container(
                                  width: ScreenDimensions.widthPercentage(
                                      context, 15),
                                  height: ScreenDimensions.heightPercentage(
                                      context, 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        ScreenDimensions.radius(context, 0.5)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppWord.confirm,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize:
                                          AppFonts.smallTitleFont(context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              transitionDuration: const Duration(milliseconds: 300),
            );
          },
          child: Container(
              width: ScreenDimensions.widthPercentage(context, 4),
              height: ScreenDimensions.heightPercentage(context, 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
              child: Icon(
                Icons.add,
                color: AppColors.white,
              )),
        ),
      ),
    );
  }
}

class AddAppointmentFields extends StatelessWidget {
  const AddAppointmentFields({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.maxLines = 1,
    this.fieldWidth,
    this.validator,
    this.onChanged,
    this.mainAxisAlignment,
    this.cardWidth,
    this.readOnly,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final double? fieldWidth;

  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final MainAxisAlignment? mainAxisAlignment;
  final double? cardWidth;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenDimensions.widthPercentage(context, 1)),
      child: SizedBox(
        width: cardWidth,
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenDimensions.widthPercentage(context, 2)),
              child: SizedBox(
                width:
                    fieldWidth ?? ScreenDimensions.widthPercentage(context, 15),
                child: TextFormField(
                  readOnly: readOnly ?? false,
                  textAlign: TextAlign.center,
                  onChanged: onChanged,
                  controller: controller,
                  validator: validator,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenDimensions.radius(context, 3))),
                      focusColor: AppColors.primaryColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              ScreenDimensions.radius(context, 3))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              ScreenDimensions.radius(context, 3)))),
                  maxLines: maxLines,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenDimensions.widthPercentage(context, 2)),
              child: Text(
                title,
                style: TextStyle(fontSize: AppFonts.subTitleFont(context)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
