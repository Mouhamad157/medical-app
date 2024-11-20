import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/network/dio_helper.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/modules/home/view/home_screen.dart';
import 'package:medical_app/modules/login/model/login_model.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map <String, dynamic> employeeChoice = {
    "medical_center_id": null,
    "coverage_id": null,
    "office_id": null,
    "agency_id": null,
    "access_id": null,
    "partner_id": null,
  };
  List<LoginModels> coverages = [];
  List<LoginModels> agencies = [];
  List<LoginModels> partners = [];
  List<LoginModels> offices = [];
  List<LoginModels> medicalCenters = [];
  List<LoginModels> accesses = [];
  String coverage = 'مستوى التغطية';
  String agency = 'المنظمة';
  String partner = 'الشريك';
  String office = 'المكتب';
  String medicalCenter = 'المركز';
  String access = 'طريقة الوصول';
  bool isLoading = false;
  bool isPageLoading = true;

  void login() async {
    isLoading = true;
    update();
    await DioHelper.login(name: userNameController.text,
        password: passwordController.text,
        employeeChoice: employeeChoice).then((value) {
          print(value);
          if (value['status'] == true&&value['message']=='Operation completed successfully.'){
            isLoading = false;
            StorageHandler().setToken(value['data']['token']);
            StorageHandler().setRole(value['data']['role'][0]);
            userNameController.clear();
            passwordController.clear();
            Get.offAll(const HomeScreen(),transition: Transition.zoom);
          }if(value['message']=='كلمة السر خاطئة.'){
            isLoading =false;
            Get.snackbar('خطأ', 'كلمة السر خاطئة');
          }if(value['message'] =='Employee not found' && value['data']== null){
            isLoading = false;
            Get.snackbar('خطأ', 'هذا الموظف غير موجود');
          }
          if(value['message'] =='Employee not found'){
            isLoading = false;
            Get.snackbar('خطأ', 'هذا الموظف غير موجود');
          }
    });
    update();
  }

  Future  getCoverages()async{
    await DioHelper.getCoverages().then((value){
      value['data'].forEach((e){
        coverages.add(LoginModels.fromJson(json: e));
      });
    });
  }
  Future  getAgencies()async{
    await DioHelper.getAgencies().then((value){
      value['data'].forEach((e){
        agencies.add(LoginModels.fromJson(json: e));
      });
    });
  }
  Future  getPartners()async{
    await DioHelper.getPartners().then((value){
      value['data'].forEach((e){
        partners.add(LoginModels.fromJson(json: e));
      });
    });
  }
  Future  getOffices()async{
    await DioHelper.getOffices().then((value){
      value['data'].forEach((e){
        offices.add(LoginModels.fromJson(json: e));
      });
    });
  }
  Future  getMedicalCenters()async{
    await DioHelper.getMedicalCenters().then((value){
      value['data'].forEach((e){
        medicalCenters.add(LoginModels.fromJson(json: e));
      });
    });
  }
  Future  getAccesses()async{
    await DioHelper.getAccesses().then((value){
      value['data'].forEach((e){
        accesses.add(LoginModels.fromJson(json: e));
      });
    });
  }
  @override
  void onInit() async{
    isPageLoading = true;
    await getAccesses();
    await getAgencies();
    await getPartners();
    await getOffices();
    await getMedicalCenters();
    await getCoverages();
    isPageLoading = false;
    update();
    super.onInit();
  }
}