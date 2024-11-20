import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/colors/colors.dart';
import 'package:medical_app/core/images/app_images.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/core/texts/words.dart';
import 'package:medical_app/core/utils/app_fonts.dart';
import 'package:medical_app/core/utils/dimensions.dart';
import 'package:medical_app/modules/login/controller/login_controller.dart';
import 'package:medical_app/modules/login/view/login.dart';
import 'package:medical_app/modules/record/view/record_screen.dart';
import '../../../core/components/components.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppWord.doctorAppointments,
            style: TextStyle(
              fontSize: AppFonts.subTitleFont(context),
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: (){
                StorageHandler().removeRole();
                StorageHandler().removeToken();
                Get.put(LoginController());
                controller.loginController.employeeChoice= {
                  "medical_center_id": null,
                  "coverage_id": null,
                  "office_id": null,
                  "agency_id": null,
                  "access_id": null,
                  "partner_id": null,
                };
                controller.loginController.accesses.clear();
                controller.loginController.agencies.clear();
                controller.loginController.partners.clear();
                controller.loginController.offices.clear();
                controller.loginController.medicalCenters.clear();
                controller.loginController.coverages.clear();
                controller.loginController.coverage = 'مستوى التغطية';
                controller.loginController.agency = 'المنظمة';
                controller.loginController.partner = 'الشريك';
                controller.loginController.office = 'المكتب';
                controller.loginController.medicalCenter = 'المركز';
                controller.loginController.access = 'طريقة الوصول';
                controller.loginController.onInit();
                Get.offAll(const LoginScreen(),transition: Transition.fadeIn);
              },
              child: Container(
                width: ScreenDimensions.widthPercentage(context, 8),
                height: ScreenDimensions.heightPercentage(context, 8),
                alignment: Alignment.center,
                child: AppText.smallBold(text: 'تسجيل الخروج',color: AppColors.white,),
              ),
            )
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<HomeScreenController>(builder: (_) {
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: ScreenDimensions.heightPercentage(context, 5)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: ScreenDimensions.widthPercentage(context, 30),
                    //   height: ScreenDimensions.heightPercentage(context, 20),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(
                    //         ScreenDimensions.radius(context, 1)),
                    //     border: Border.all(
                    //       color: controller.primaryColor,
                    //       width: ScreenDimensions.widthPercentage(context, 0.2),
                    //     ),
                    //   ),
                    //   child: Text('asjkdaksdasdkjasdkj'),
                    // )
                    Container(
                      alignment: Alignment.topCenter,
                      width: ScreenDimensions.widthPercentage(context, 80),
                      height: ScreenDimensions.heightPercentage(context, 60),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor,
                            width:
                                ScreenDimensions.widthPercentage(context, 0.1)),
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
                                title: AppWord.process,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    ScreenDimensions.radius(context, 1),
                                  ),
                                ),
                                width:
                                    ScreenDimensions.widthPercentage(context, 17),
                              ),
                              TitleCard(
                                title: AppWord.age,
                                width:
                                    ScreenDimensions.widthPercentage(context, 12),
                              ),
                              TitleCard(
                                title: AppWord.gender,
                                width:
                                    ScreenDimensions.widthPercentage(context, 11),
                              ),
                              TitleCard(
                                title: AppWord.fullName,
                                width: ScreenDimensions.widthPercentage(
                                    context, 21.75),
                              ),
                              TitleCard(
                                title: AppWord.id,
                                width:
                                    ScreenDimensions.widthPercentage(context, 13),
                              ),
                              TitleCard(
                                title: '',
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        ScreenDimensions.radius(context, 1))),
                                width:
                                    ScreenDimensions.widthPercentage(context, 5),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: ScreenDimensions.widthPercentage(context, 80),
                            height:
                                ScreenDimensions.heightPercentage(context, 54),
                            child: ListView.builder(
                              itemCount: controller.model.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  RecordScreen(
                                                      medicalRecordId: controller
                                                          .model[index].medicalRecordId),
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  transition: Transition.zoom,
                                                arguments: {
                                                    'medical_record_id':controller.model[index].medicalRecordId
                                                }
                                              );
                                            },
                                            child: SizedBox(
                                              width: ScreenDimensions
                                                  .widthPercentage(context, 5),
                                              child: Icon(
                                                Icons.ios_share,
                                                color: Colors.green,
                                                size: ScreenDimensions
                                                    .widthPercentage(context, 3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 12),
                                      child: Text(
                                        controller.model[index].age.toString(),
                                        // '10 years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.smallTitleFont(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 11),
                                      child: Text(
                                        controller.model[index].gender=='Female'||controller.model[index].gender=='female'?'أنثى':'ذكر',
                                        // 'male',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.smallTitleFont(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 21.75),
                                      child: Text(
                                        controller.model[index].fullName,
                                        // 'fullName',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.smallTitleFont(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 13),
                                      child: Text(
                                        controller.model[index].medicalRecordId.toString(),
                                        // 'id',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.smallTitleFont(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenDimensions.widthPercentage(
                                          context, 5),
                                      child: Text(
                                        '$index',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.smallTitleFont(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    //     '1',
                                    //   style: TextStyle(fontSize: AppFonts.smallTitleFont(context)),
                                    // )
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
              ],
            ),
          );
        }),
      ),
    );
  }
}

//
// SingleChildScrollView(
// child: Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: Get.height * .15,
// ),
// Text(
// 'Medical',
// style: TextStyle(
// color: Colors.white,
// fontSize: Get.width * .1,
// fontWeight: FontWeight.bold),
// ).paddingSymmetric(horizontal: Get.width * .1),
// Text(
// 'Application',
// style: TextStyle(
// color: Colors.white,
// fontSize: Get.width * .1,
// fontWeight: FontWeight.bold),
// ).paddingSymmetric(horizontal: Get.width * .1),
// Container(
// width: Get.width,
// margin: EdgeInsets.symmetric(horizontal: Get.width * .15),
// height: Get.height * .1,
// decoration: BoxDecoration(
// color: const Color(0xff1EA289),
// borderRadius: BorderRadius.circular(20)
// ),
// alignment: Alignment.center,
// child:  Text(
// 'Take a tour',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: Get.width*.05
// ),
// ),
// ).paddingOnly(top: Get.height * .3),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: Container(
// alignment: Alignment.center,
// width: Get.width * .2,
// child:  Text(
// 'SIGN UP',
// style: TextStyle(
// color: Colors.white, fontWeight: FontWeight.bold,
// fontSize: Get.width*.04),
// ),
// ),
// ),
// Expanded(
// child: Container(
// alignment: Alignment.center,
// width: Get.width * .3,
// child:  Text(
// 'LOGIN',
// style: TextStyle(
// color: Colors.white, fontWeight: FontWeight.bold,
// fontSize: Get.width*.04),
// ),
// ),
// ),
// ],
// ).paddingSymmetric(vertical: Get.height * .1)
// ],
// ),
// ),
// )
