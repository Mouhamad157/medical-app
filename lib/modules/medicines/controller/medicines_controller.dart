
import 'package:get/get.dart';
import '../../../core/network/dio_helper.dart';
import '../model/medicines_model.dart';

class MedicinesController extends GetxController {
  List<MedicinesModel> medicineModel=[];
  bool isMedicinesEmpty  = false;
  void getMedicalCenterMedicine()async{
    await DioHelper.getMedicalCenterMedicine().then((value) {
      if(value['data']!= null||value['data'].isNotEmpty){
        value['data'].forEach((element){
          medicineModel.add(MedicinesModel.fromJson(json: element));
        });
      }else{
        isMedicinesEmpty = true ;
        update();
      }
      update();
    });
  }

  @override
  void onInit() {
    getMedicalCenterMedicine();
    super.onInit();
  }
}