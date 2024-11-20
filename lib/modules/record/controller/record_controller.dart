import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_app/core/network/dio_helper.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/core/texts/words.dart';
import 'package:medical_app/core/utils/dimensions.dart';
import 'package:medical_app/modules/record/model/record_model.dart';

import '../../../core/colors/colors.dart';
import '../../../core/components/components.dart';
import '../../../core/utils/app_fonts.dart';
import '../../medicines/model/medicines_model.dart';

class RecordController extends GetxController {
  String activity = AppWord.activity;
  late int medicalRecordId;
  double medicinesHeight = ScreenDimensions.heightPercentage(Get.context!, 5);
  bool isLoading = true;
  bool haveDoctorVisits = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController idController = TextEditingController();
  DateTime? date;
  RecordDetailsModel recordModel = RecordDetailsModel(
    id: 0,
    fullName: '..انتظر',
    gender: '..انتظر',
    phoneNumber: '..انتظر',
    age: '..انتظر',
    address: '..انتظر',
    specialNeeds: 0,
    lastName: '..انتظر',
    name: '..انتظر',
    fatherName: '..انتظر',
    motherName: '..انتظر',
  );
  List<VisitsDetailsModel> visitsModel = [];
  List<TextEditingController> amountController = [];

  void getDoctorVisit(int medicalRecordId) async {
    isLoading = true;
    update();
    await DioHelper.getDoctorVisit(medicalRecordId).then((value) {
      if (value['message'] == 'Operation failed.') {
        haveDoctorVisits = false;
        isLoading = false;
        update();
      }
      if (value['message'] == 'Operation completed successfully.') {
        value['data'].forEach((element) {
          visitsModel.add(VisitsDetailsModel.fromJson(json: element));
        });
        haveDoctorVisits = true;
        isLoading = false;
        update();
      }
    });
    update();
  }

  void getRecordDetails(int medicalRecordId) async {
    isLoading = true;
    update();
    await DioHelper.getRecordDetails(medicalRecordId).then((value) {
      if (value['message'] ==
          'The medical record with the given ID was not found.') {
        isLoading = false;
        Get.back();
        Get.snackbar('تحذير', 'السجل غير متاح');
      } else {
        if (value['data'] != null) {
          recordModel = RecordDetailsModel.fromJson(json: value['data']);
          isLoading = false;
          update();
        } else {
          isLoading = false;
          Get.snackbar('تحذير', 'تحقق من اتصالك بالانترنت');
          update();
        }
      }
    });
    update();
  }

  Future createVisit() async {
    bool healthCare = false;
    bool healthEdu = false;
    update();
    if (resultController.text.isEmpty ||
        dateController.text.isEmpty ||
        activity == AppWord.activity) {
      Get.back();
      Get.snackbar('تحذير', 'الرجاء ملئ كافة البيانات');
    } else {
      if (StorageHandler().role == 'women-doctor') {
        await DioHelper.createWomenDoctorVisit(
          date: dateController.text,
          result: resultController.text,
          medicalRecordId: medicalRecordId,
          healthEducation: healthEdu,
          healthCare: healthCare,
          activity: activity,
        ).then((value) {
          Get.back();
          Get.back();
          visitsModel.clear();
          getDoctorVisit(medicalRecordId);
          Get.dialog(Material(
            color: Colors.transparent,
            child: Container(
              height: ScreenDimensions.heightPercentage(Get.context!, 40),
              width: ScreenDimensions.widthPercentage(Get.context!, 50),
              margin: EdgeInsets.symmetric(vertical: ScreenDimensions.heightPercentage(Get.context!, 35),horizontal: ScreenDimensions.widthPercentage(Get.context!, 30)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(ScreenDimensions.radius(Get.context!, 1)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText.subtitleBold(text:'هل تريد صرف دواء'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.dialog(
                              Material(
                                color: Colors.transparent,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GetBuilder<RecordController>(
                                      builder: (_) {
                                        return Container(
                                          alignment: Alignment.topCenter,
                                          width: ScreenDimensions.widthPercentage(
                                              Get.context!, 70),
                                          height: ScreenDimensions.heightPercentage(
                                              Get.context!, 50),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: ScreenDimensions
                                                    .widthPercentage(Get.context!, 0.1)),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  ScreenDimensions.radius(
                                                      Get.context!, 1)),
                                              topRight: Radius.circular(
                                                  ScreenDimensions.radius(
                                                      Get.context!, 1)),
                                            ),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              vertical: ScreenDimensions.heightPercentage(Get.context!, 10),
                                              horizontal: ScreenDimensions.widthPercentage(Get.context!, 5)
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  TitleCard(
                                                    title: AppWord.name,
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(
                                                        ScreenDimensions.radius(
                                                            Get.context!, 1),
                                                      ),
                                                    ),
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 17),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.medicineType,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 17),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.scientificName,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 22),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.unit,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11.75),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.quantity,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.titer,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            ScreenDimensions.radius(
                                                                Get.context!, 1))),
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11),
                                                  ),
                                                ],
                                              ), isMedicinesEmpty
                                                  ? Center(
                                                child: AppText.subtitleBold(
                                                    text: 'لا يوجد أدوية'),
                                              )
                                                  : Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: ScreenDimensions.widthPercentage(Get.context!, 90),
                                                        height: ScreenDimensions.heightPercentage(Get.context!, 74),
                                                        child: ListView.builder(
                                                      itemCount: medicineModel.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Container(
                                                          height: ScreenDimensions.heightPercentage(context, 17),
                                                          margin: EdgeInsets.symmetric(
                                                              vertical: ScreenDimensions.heightPercentage(context, 0.5),
                                                              horizontal: ScreenDimensions.widthPercentage(context, 1)
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: AppColors.white,
                                                              borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1)),
                                                              boxShadow:  [
                                                                BoxShadow(
                                                                    offset: const Offset(0,2),
                                                                    blurStyle: BlurStyle.outer,
                                                                    blurRadius: 5,
                                                                    color: AppColors.silver
                                                                ),
                                                              ]
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 15),
                                                                    child: Text(medicineModel[index].name,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 17),
                                                                    child: Text(medicineModel[index].type,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 22),
                                                                    child: Text(medicineModel[index].scientificName,
                                                                      maxLines: 2,
                                                                      textAlign: TextAlign.center,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 11.75),
                                                                    child: Text(medicineModel[index].unit.toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions
                                                                        .widthPercentage(
                                                                        context,
                                                                        11),
                                                                    child: Text(
                                                                      medicineModel[
                                                                      index]
                                                                          .quantity
                                                                          .toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions
                                                                        .widthPercentage(
                                                                        context,
                                                                        11),
                                                                    child: Text(
                                                                      medicineModel[
                                                                      index]
                                                                          .titer
                                                                          .toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ).paddingSymmetric(vertical: ScreenDimensions.widthPercentage(context, 1)),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  GetBuilder<RecordController>(
                                                                      builder: (_) {
                                                                        return AppTextFormField(
                                                                          width: ScreenDimensions.widthPercentage(context, 25),
                                                                          labelText: 'الكمية المراد صرفها',
                                                                          keyboardType: TextInputType.number,
                                                                          controller: amountController[index],
                                                                          onChanged: (value){
                                                                            if(int.parse(amountController[index].text)>medicineModel[index].quantity){
                                                                              amountController[index].text = medicineModel[index].quantity.toString();
                                                                            }
                                                                            if(int.parse(amountController[index].text)<0){
                                                                              value = 0.toString();
                                                                            }
                                                                            if(value.isEmpty){
                                                                              amountController[index].text = '0';
                                                                            }
                                                                            update();
                                                                          },
                                                                        );
                                                                      }
                                                                  ),
                                                                ],)
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                                                                      ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: (){
                                                            List<int> visitId = [];
                                                            List<int> quantity = [];
                                                            List<int> activityId = [];
                                                            List<int> medicalCenterId = [];
                                                            for(int i = 0; i<medicineModel.length;i++){
                                                              visitId.add(visitsModel.last.id);
                                                            }
                                                            for(int i = 0 ; i<medicineModel.length ; i++){
                                                              if(amountController[i].text.isNotEmpty && int.parse(amountController[i].text)>0){
                                                                quantity.add(int.parse(amountController[i].text));
                                                              }else{
                                                                quantity.add(0);
                                                              }
                                                            }
                                                            for(int i = 0 ; i<medicineModel.length ; i++){
                                                              activityId.add(activity==AppWord.healthCare?1:activity == AppWord.healthEducation?2:3);
                                                            }
                                                            for(int i = 0 ; i<medicineModel.length;i++){
                                                              medicalCenterId.add(medicineModel[i].medicalCenterId);
                                                            }
                                                            orderMultiMedicines(
                                                                visitId: visitId,
                                                                quantity: quantity,
                                                                activityId: activityId,
                                                                medicalCenterId: medicalCenterId);
                                                          },
                                                          child: Container(
                                                            width: ScreenDimensions.widthPercentage(Get.context!, 8),
                                                            height: ScreenDimensions.heightPercentage(Get.context!, 6),
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: AppColors.primaryColor,
                                                              borderRadius: BorderRadius.circular(ScreenDimensions.radius(Get.context!, 2)),
                                                            ),
                                                            child: AppText.smallBold(text: 'صرف',color: AppColors.white,),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ));
                        },
                        child: SizedBox(
                          child: AppText.subtitleBold(text: AppWord.yes),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SizedBox(
                          child: AppText.subtitleBold(text: AppWord.no),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
          update();
        });
        update();
      }
      if (StorageHandler().role == 'child-doctor') {
        await DioHelper.createChildDoctorVisit(
          date: dateController.text,
          result: resultController.text,
          medicalRecordId: medicalRecordId,
          healthCare: healthCare,
          healthEducation: healthEdu,
          activity: activity,
        ).then((value) {
          Get.back();
          Get.back();
          visitsModel.clear();
          getDoctorVisit(medicalRecordId);
          Get.dialog(Material(
            color: Colors.transparent,
            child: Container(
              height: ScreenDimensions.heightPercentage(Get.context!, 40),
              width: ScreenDimensions.widthPercentage(Get.context!, 50),
              margin: EdgeInsets.symmetric(vertical: ScreenDimensions.heightPercentage(Get.context!, 35),horizontal: ScreenDimensions.widthPercentage(Get.context!, 30)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(ScreenDimensions.radius(Get.context!, 1)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText.subtitleBold(text:'هل تريد صرف دواء'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.dialog(
                              Material(
                                color: Colors.transparent,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GetBuilder<RecordController>(
                                      builder: (_) {
                                        return Container(
                                          alignment: Alignment.topCenter,
                                          width: ScreenDimensions.widthPercentage(
                                              Get.context!, 70),
                                          height: ScreenDimensions.heightPercentage(
                                              Get.context!, 50),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: ScreenDimensions
                                                    .widthPercentage(Get.context!, 0.1)),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  ScreenDimensions.radius(
                                                      Get.context!, 1)),
                                              topRight: Radius.circular(
                                                  ScreenDimensions.radius(
                                                      Get.context!, 1)),
                                            ),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              vertical: ScreenDimensions.heightPercentage(Get.context!, 10),
                                              horizontal: ScreenDimensions.widthPercentage(Get.context!, 5)
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  TitleCard(
                                                    title: AppWord.name,
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(
                                                        ScreenDimensions.radius(
                                                            Get.context!, 1),
                                                      ),
                                                    ),
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 17),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.medicineType,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 17),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.scientificName,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 22),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.unit,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11.75),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.quantity,
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11),
                                                  ),
                                                  TitleCard(
                                                    title: AppWord.titer,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            ScreenDimensions.radius(
                                                                Get.context!, 1))),
                                                    width: ScreenDimensions
                                                        .widthPercentage(
                                                        Get.context!, 11),
                                                  ),
                                                ],
                                              ), isMedicinesEmpty
                                                  ? Center(
                                                child: AppText.subtitleBold(
                                                    text: 'لا يوجد أدوية'),
                                              )
                                                  : Stack(
                                                children: [
                                                  SizedBox(
                                                    width: ScreenDimensions.widthPercentage(Get.context!, 90),
                                                    height: ScreenDimensions.heightPercentage(Get.context!, 74),
                                                    child: ListView.builder(
                                                      itemCount: medicineModel.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Container(
                                                          height: ScreenDimensions.heightPercentage(context, 17),
                                                          margin: EdgeInsets.symmetric(
                                                              vertical: ScreenDimensions.heightPercentage(context, 0.5),
                                                              horizontal: ScreenDimensions.widthPercentage(context, 1)
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: AppColors.white,
                                                              borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1)),
                                                              boxShadow:  [
                                                                BoxShadow(
                                                                    offset: const Offset(0,2),
                                                                    blurStyle: BlurStyle.outer,
                                                                    blurRadius: 5,
                                                                    color: AppColors.silver
                                                                ),
                                                              ]
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 15),
                                                                    child: Text(medicineModel[index].name,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 17),
                                                                    child: Text(medicineModel[index].type,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 22),
                                                                    child: Text(medicineModel[index].scientificName,
                                                                      maxLines: 2,
                                                                      textAlign: TextAlign.center,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts.smallTitleFont(context),
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions.widthPercentage(context, 11.75),
                                                                    child: Text(medicineModel[index].unit.toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions
                                                                        .widthPercentage(
                                                                        context,
                                                                        11),
                                                                    child: Text(
                                                                      medicineModel[
                                                                      index]
                                                                          .quantity
                                                                          .toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenDimensions
                                                                        .widthPercentage(
                                                                        context,
                                                                        11),
                                                                    child: Text(
                                                                      medicineModel[
                                                                      index]
                                                                          .titer
                                                                          .toString(),
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                        fontSize: AppFonts
                                                                            .smallTitleFont(
                                                                            context),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ).paddingSymmetric(vertical: ScreenDimensions.widthPercentage(context, 1)),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  GetBuilder<RecordController>(
                                                                      builder: (_) {
                                                                        return AppTextFormField(
                                                                          width: ScreenDimensions.widthPercentage(context, 25),
                                                                          labelText: 'الكمية المراد صرفها',
                                                                          keyboardType: TextInputType.number,
                                                                          controller: amountController[index],
                                                                          onChanged: (value){
                                                                            if(int.parse(amountController[index].text)>medicineModel[index].quantity){
                                                                              amountController[index].text = medicineModel[index].quantity.toString();
                                                                            }
                                                                            if(int.parse(amountController[index].text)<0){
                                                                              value = 0.toString();
                                                                            }
                                                                            if(value.isEmpty){
                                                                              amountController[index].text = '0';
                                                                            }
                                                                            update();
                                                                          },
                                                                        );
                                                                      }
                                                                  ),
                                                                ],)
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        List<int> visitId = [];
                                                        List<int> quantity = [];
                                                        List<int> activityId = [];
                                                        List<int> medicalCenterId = [];
                                                        for(int i = 0; i<medicineModel.length;i++){
                                                          visitId.add(visitsModel.last.id);
                                                        }
                                                        for(int i = 0 ; i<medicineModel.length ; i++){
                                                          if(amountController[i].text.isNotEmpty && int.parse(amountController[i].text)>0){
                                                            quantity.add(int.parse(amountController[i].text));
                                                          }else{
                                                            quantity.add(0);
                                                          }
                                                        }
                                                        for(int i = 0 ; i<medicineModel.length ; i++){
                                                          activityId.add(activity==AppWord.healthCare?1:activity == AppWord.healthEducation?2:3);
                                                        }
                                                        for(int i = 0 ; i<medicineModel.length;i++){
                                                          medicalCenterId.add(medicineModel[i].medicalCenterId);
                                                        }
                                                        orderMultiMedicines(
                                                            visitId: visitId,
                                                            quantity: quantity,
                                                            activityId: activityId,
                                                            medicalCenterId: medicalCenterId);
                                                      },
                                                      child: Container(
                                                        width: ScreenDimensions.widthPercentage(Get.context!, 8),
                                                        height: ScreenDimensions.heightPercentage(Get.context!, 6),
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          color: AppColors.primaryColor,
                                                          borderRadius: BorderRadius.circular(ScreenDimensions.radius(Get.context!, 2)),
                                                        ),
                                                        child: AppText.smallBold(text: 'صرف',color: AppColors.white,),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ));
                        },
                        child: SizedBox(
                          child: AppText.subtitleBold(text: AppWord.yes),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SizedBox(
                          child: AppText.subtitleBold(text: AppWord.no),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
          update();
        });
        update();
      }
    }
  }

  List<MedicinesModel> medicineModel = [];
  bool isMedicinesEmpty = false;

  void getMedicalCenterMedicine() async {
    isLoading = true;
    update();
    await DioHelper.getMedicalCenterMedicine().then((value) {
      if (value['data'] != 'لا يوجد دواء في هذا المركز') {
        value['data'].forEach((element) {
          medicineModel.add(MedicinesModel.fromJson(json: element));
          amountController.add(TextEditingController());
          isLoading = false;
        });
      } else {
        isMedicinesEmpty = true;
        isLoading = false;
        update();
      }
      update();
    });
  }

  void orderMultiMedicines({
    required List<int> visitId,
    required List<int> quantity,
    required List<int> activityId,
    required List<int> medicalCenterId,
}) async{
    Get.dialog(PopScope(
        canPop: false,
        child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)),barrierDismissible: false);
    for(int i = 0 ;i<quantity.length ; i++){
      if(quantity[i]>0){
        await DioHelper.orderMedicine(visitId: visitId[i], quantity: quantity[i], activityId: activityId[i], medicalCenterId: medicalCenterId[i]).then((value){
          print(value);
        });
      }
    }
    for(int i = 0 ; i<amountController.length ; i++){
      amountController[i].clear();
    }
    Get.back();
    Get.back();
    Get.snackbar('تم', 'تمت صرف الأدوية بنجاح');
  }

  void orderMedicine({
    required int visitId,
    required int quantity,
    required int activityId,
    required int medicalCenterId,
  }) async {
    await DioHelper.orderMedicine(
      visitId: visitId,
      quantity: quantity,
      activityId: activityId,
      medicalCenterId: medicalCenterId,
    ).then((value) {
      if (value['message'] == 'Operation completed successfully.') {
        Get.snackbar('تم', 'تمت العملية بنجاح');
      } else {
        Get.snackbar('تحذير', 'حدث خطأ ما يرجى المحاولة لاحقا');
      }
    });
  }

bool isVisitMedicineEmpty = true;
  List<Map<String,dynamic>> medicines = [];
  Future getVisitMedicine({
    required int visitId
})async{
    medicines.clear();
    Get.dialog(PopScope(canPop: false,child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),),),barrierDismissible: false);
    if(StorageHandler().role=='women-doctor'){
      await DioHelper.getWomenVisitMedicine(visitId: visitId).then((value){
        if(value['data'].isEmpty){
          isVisitMedicineEmpty = true;
          Get.back();
          Get.back();
          Get.snackbar('ملاحظة', 'لا يوجد أدوبة مصروفة في هذه الزيارة');
          return;
        }if(value['data'].isNotEmpty){
          value['data'].forEach((e){
            medicines.add(e);
          });
          Get.back();
          isVisitMedicineEmpty = false;
          return;
        }
      });
    }if(StorageHandler().role == 'child-doctor'){
      await DioHelper.getChildVisitMedicine(visitId: visitId).then((value){
        if(value['data'].isEmpty){
          isVisitMedicineEmpty = true;
          Get.back();
          Get.snackbar('ملاحظة', 'لا يوجد أدوبة مصروفة في هذه الزيارة');
          return;
        }if(value['data'].isNotEmpty){
          value['data'].forEach((e){
            medicines.add(e);
          });
          Get.back();
          isVisitMedicineEmpty = false;
          return;
        }
      });
    }
    update();
  }

  @override
  void onInit() {
    getMedicalCenterMedicine();
    getDoctorVisit(Get.arguments['medical_record_id']);
    getRecordDetails(Get.arguments['medical_record_id']);
    super.onInit();
  }

  @override
  void dispose() {
    resultController.dispose();
    super.dispose();
  }
}
