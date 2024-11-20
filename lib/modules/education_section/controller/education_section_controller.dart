import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medical_app/modules/education_section/view/education_section_view.dart';

class EducationSectionController extends GetxController{
  int currentIndex = 0;

   // Home


   // Save Session Data
   late  TextEditingController partnerController;
   late  TextEditingController activityController;
   late  TextEditingController dateController;
   late  TextEditingController provinceController;
   late  TextEditingController areaController;
   late  TextEditingController placeController;
   late  TextEditingController femaleAdultNumberController;
   late  TextEditingController maleAdultNumberController;
   late  TextEditingController femaleChildNumberController;
   late  TextEditingController maleChildNumberController;
   late  TextEditingController specialNeedsController;
   late  TextEditingController newBeneficiariesController;
   late  TextEditingController beneficiariesTypeController;

   // Send Advice



  Widget body(){
    if(currentIndex==0){
      return const HomeBody();
    }
    if(currentIndex == 1){
      return const SaveSessionData();
    }
    if(currentIndex == 2){
      return Container();
    }
    if(currentIndex == 3){
      return const SaveSessionData2();
    }
    if(currentIndex == 4){
      return const SaveSessionData3();
    }
    if(currentIndex == 5){
      return const SaveSessionData4();
    }
    else{
      return const SizedBox.shrink();
    }
  }
@override
  void onInit() {
    partnerController = TextEditingController();
    activityController = TextEditingController();
    dateController = TextEditingController();
    provinceController = TextEditingController();
    areaController = TextEditingController();
    placeController = TextEditingController();
    beneficiariesTypeController = TextEditingController();
    femaleAdultNumberController = TextEditingController();
    maleAdultNumberController = TextEditingController();
    femaleChildNumberController = TextEditingController();
    maleChildNumberController = TextEditingController();
    newBeneficiariesController = TextEditingController();
    specialNeedsController = TextEditingController();
    super.onInit();
  }
}