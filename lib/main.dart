import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/storage_handler/storage_handler.dart';
import 'package:medical_app/modules/education_section/view/education_section_view.dart';
import 'package:medical_app/modules/home/view/home_screen.dart';
import 'package:medical_app/modules/login/controller/login_controller.dart';

import 'modules/login/view/login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorageHandler().hasToken?const HomeScreen():const LoginScreen(),
      // home: const EducationSection(),
    );
  }
}