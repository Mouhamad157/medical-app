import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/colors/colors.dart';
import 'package:medical_app/core/components/components.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/core/texts/words.dart';
import 'package:medical_app/modules/nutrition_section/controller/nutrition_section_controller.dart';

import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/dimensions.dart';

class NutritionSection extends GetView<NutritionSectionController> {
  const NutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NutritionSectionController());
    return Scaffold(
      appBar: AppBar(
        title: AppText.subtitleBold(
          text: AppWord.nutritionSection,
          color: AppColors.white,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<NutritionSectionController>(builder: (_) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  width: ScreenDimensions.widthPercentage(context, 80),
                  height: ScreenDimensions.heightPercentage(context, 80),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.primaryColor,
                        width: ScreenDimensions.widthPercentage(context, 0.1)),
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(ScreenDimensions.radius(context, 1)),
                      topRight:
                          Radius.circular(ScreenDimensions.radius(context, 1)),
                    ),
                  ),
                  child: Column(
                    children: [
                      StorageHandler().role == 'women-doctor'
                          ? Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  TitleCard(
                                    title: AppWord.visitNumber,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        ScreenDimensions.radius(context, 1),
                                      ),
                                    ),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 7),
                                  ),
                                  TitleCard(
                                    title: AppWord.visitDate,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 12),
                                  ),
                                  TitleCard(
                                    title: AppWord.weight,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 8),
                                  ),
                                  TitleCard(
                                    title: AppWord.status,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 25.75),
                                  ),
                                  TitleCard(
                                    title: AppWord.situation,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        ScreenDimensions.radius(context, 1),
                                      ),
                                    ),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 27),
                                  ),
                                ],
                              ),
                            )
                          : Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  TitleCard(
                                    title: AppWord.visitNumber,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        ScreenDimensions.radius(context, 1),
                                      ),
                                    ),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 5),
                                  ),
                                  TitleCard(
                                    title: AppWord.visitDate,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 12),
                                  ),
                                  TitleCard(
                                    title: AppWord.weight,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 5),
                                  ),
                                  TitleCard(
                                    title: AppWord.height,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 5),
                                  ),
                                  TitleCard(
                                    title: AppWord.status,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 25.75),
                                  ),
                                  TitleCard(
                                    title: AppWord.zScore,
                                    width: ScreenDimensions.widthPercentage(
                                        context, 13.5),
                                  ),
                                  TitleCard(
                                    title: AppWord.macu,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            ScreenDimensions.radius(
                                                context, 1))),
                                    width: ScreenDimensions.widthPercentage(
                                        context, 13.5),
                                  ),
                                ],
                              ),
                            ),
                      controller.haveDoctorVisits
                          ? Center(
                              child: Text(
                              AppWord.thisPatientDoseNotHaveVisitRecord,
                              style: TextStyle(
                                  fontSize: AppFonts.subTitleFont(context)),
                            ))
                          : SizedBox(
                              width:
                                  ScreenDimensions.widthPercentage(context, 80),
                              height: ScreenDimensions.heightPercentage(
                                  context, 34.4),
                              child: StorageHandler().role == 'women-doctor'
                                  ? Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ListView.builder(
                                        itemCount:
                                            controller.womenVisitModel.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 7),
                                                child: AppText.smallBold(
                                                    text: controller
                                                        .womenVisitModel[index]
                                                        .id
                                                        .toString(),textAlign: TextAlign.center,),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 12),
                                                child: Text(
                                                  controller
                                                      .womenVisitModel[index]
                                                      .date,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 8),
                                                child: Text(
                                                  controller
                                                      .womenVisitModel[index]
                                                      .weight
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 25.75),
                                                child: Text(
                                                  controller
                                                      .womenVisitModel[index]
                                                      .currentStatus,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 27),
                                                child: Text(
                                                  controller
                                                      .womenVisitModel[index]
                                                      .statusType,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).paddingSymmetric(
                                              vertical: ScreenDimensions
                                                  .widthPercentage(context, 1));
                                        },
                                      ),
                                    )
                                  : Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ListView.builder(
                                        itemCount:
                                            controller.childVisitModel.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 5),
                                                child: AppText.smallBold(
                                                    text: controller
                                                        .childVisitModel[index]
                                                        .id
                                                        .toString(),textAlign: TextAlign.center,),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 12),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .date,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 5),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .weight
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 5),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .height
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 25.75),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .currentStatus
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 13.5),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .zScore
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: ScreenDimensions
                                                    .widthPercentage(
                                                        context, 13.5),
                                                child: Text(
                                                  controller
                                                      .childVisitModel[index]
                                                      .muac
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppFonts.smallTitleFont(
                                                            context),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).paddingSymmetric(
                                              vertical: ScreenDimensions
                                                  .widthPercentage(context, 1));
                                        },
                                      ),
                                    ),
                            ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
