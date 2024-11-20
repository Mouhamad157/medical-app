import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/colors/colors.dart';
import 'package:medical_app/core/components/components.dart';
import 'package:medical_app/core/texts/words.dart';
import 'package:medical_app/core/utils/dimensions.dart';
import 'package:medical_app/modules/medicines/controller/medicines_controller.dart';

import '../../../core/utils/app_fonts.dart';

class MedicinesScreen extends GetView<MedicinesController> {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MedicinesController());
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: AppText.subtitleBold(
              text: AppWord.medicinesSection,
              color: AppColors.white,
            ),
            centerTitle: true,
            actions: [RotatedBox(quarterTurns: 90,
            child: BackButton(color: AppColors.white))],
            leading: const SizedBox.shrink(),
          ),
          body: GetBuilder<MedicinesController>(builder: (_) {
            return Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.topCenter,
                width: ScreenDimensions.widthPercentage(context, 90),
                height: ScreenDimensions.heightPercentage(context, 80),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.primaryColor,
                      width: ScreenDimensions.widthPercentage(context, 0.1)),
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
                          title: AppWord.name,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              ScreenDimensions.radius(context, 1),
                            ),
                          ),
                          width: ScreenDimensions.widthPercentage(context, 17),
                        ),
                        TitleCard(
                          title: AppWord.medicineType,
                          width: ScreenDimensions.widthPercentage(context, 17),
                        ),
                        TitleCard(
                          title: AppWord.scientificName,
                          width: ScreenDimensions.widthPercentage(context, 22),
                        ),
                        TitleCard(
                          title: AppWord.unit,
                          width: ScreenDimensions.widthPercentage(context, 11.75),
                        ),
                        TitleCard(
                          title: AppWord.quantity,
                          width: ScreenDimensions.widthPercentage(context, 11),
                        ),
                        TitleCard(
                          title: AppWord.titer,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(
                              ScreenDimensions.radius(context, 1))),
                          width: ScreenDimensions.widthPercentage(context, 11),
                        ),
                      ],
                    ),
                    controller.isMedicinesEmpty
                        ? Center(child: AppText.subtitleBold(text: 'لا يوجد أدوية'),)
                        : SizedBox(
                      width: ScreenDimensions.widthPercentage(context, 90),
                      height: ScreenDimensions.heightPercentage(context,74),
                      child: ListView.builder(
                        itemCount: controller.medicineModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 17),
                                child: Text(
                                  controller.medicineModel[index].name,
                                  textAlign:TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 17),
                                child: Text(
                                  controller.medicineModel[index].type,
                                  textAlign:TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 22),
                                child: Text(
                                  controller.medicineModel[index].scientificName,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 11.75),
                                child: Text(
                                  controller.medicineModel[index].unit.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 11),
                                child: Text(
                                  controller.medicineModel[index].quantity.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                              SizedBox(
                                width: ScreenDimensions.widthPercentage(context, 11),
                                child: Text(
                                  controller.medicineModel[index].titer.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppFonts.smallTitleFont(context),
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                            ],
                          ).paddingSymmetric(vertical: ScreenDimensions.widthPercentage(context, 1));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
