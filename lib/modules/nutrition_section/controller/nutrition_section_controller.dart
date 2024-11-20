import 'package:get/get.dart';
import 'package:medical_app/core/network/dio_helper.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/modules/nutrition_section/model/nutrition_section_model.dart';

class NutritionSectionController extends GetxController{
  bool haveDoctorVisits = true;
  bool isLoading = true;
  List<WomenVisitModel> womenVisitModel = [];
  List<ChildVisitModel> childVisitModel = [];

  void getVisits()async {
    isLoading = true;
    update();
    if(StorageHandler().role=='women-doctor'){
    await DioHelper.getWomenVisitsNutrition(medicalRecordId: Get.arguments['RecordId']).then((value) {
      if(value['status']==true){
        if (value['data'].isEmpty) {
          haveDoctorVisits = true;
          isLoading = false;
        }
        if (value['data'].isNotEmpty) {
          haveDoctorVisits = false;
          isLoading = false;
          value['data'].forEach((element) {
            womenVisitModel.add(WomenVisitModel.fromJson(json: element));
          });
        }
        update();
        return;
      }if(value['data']== 'No visits found for Record ID: ${Get.arguments['RecordId']}'){
        Get.back();
        Get.snackbar('تحذير', 'لا يوجد زيارات لصاحب هذا السجل');
      }else{
        Get.back();
        Get.snackbar('تحذير', 'حدث خطأ ما');
      }
      update();
    },);
    }
    if(StorageHandler().role == 'child-doctor'){
      await DioHelper.getChildVisitsNutrition(medicalRecordId: Get.arguments['RecordId']).then((value) {
        print(value);
        if(value['status']==true){
        if (value['data'].isEmpty) {
          haveDoctorVisits = true;
          isLoading = false;
        }
        if (value['data'].isNotEmpty) {
          haveDoctorVisits = false;
          isLoading = false;
          value['data'].forEach((element) {
            childVisitModel.add(ChildVisitModel.fromJson(json: element));
          });
        }
        update();
        return;
      }if(value['data']== 'No visits found for Record ID: ${Get.arguments['RecordId']}'){
          Get.back();
          Get.snackbar('تحذير', 'لا يوجد زيارات لصاحب هذا السجل');
        }else{
        Get.back();
        Get.snackbar('تحذير', 'حدث خطأ ما');
      }
      update();
      },);
    }
  }
  @override
  void onInit() {
    getVisits();
        super.onInit();
  }
}