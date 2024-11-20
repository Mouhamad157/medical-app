import 'dart:ui';

import 'package:get/get.dart';
import 'package:medical_app/core/network/dio_helper.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/modules/home/model/home_screen_model.dart';
import 'package:medical_app/modules/login/controller/login_controller.dart';

import '../../medicines/model/medicines_model.dart';

class HomeScreenController extends GetxController{
  int value = 0;
  List<HomeScreenModel> model = [];
  LoginController loginController = Get.find();

  void getDoctorAppointments()async{
    if(StorageHandler().role=='women-doctor'){
   await DioHelper.getWomenDoctorAppointments().then((value) {
     print(value);
   value['data'].forEach((element){model.add(HomeScreenModel.fromJson(json: element));});
      update();
    });
    return;
    }
    if(StorageHandler().role=='child-doctor'){
      await DioHelper.getChildDoctorAppointments().then((value) {
        print(value);
        value['data'].forEach((element){model.add(HomeScreenModel.fromJson(json: element));});
        update();
      });
      return;
    }
  }

  @override
  void onInit() {
    getDoctorAppointments();
    super.onInit();
  }
}