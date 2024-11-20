import 'package:dio/dio.dart';
import 'package:medical_app/core/network/end_points.dart';
import 'apps_headers.dart';

String baseUrl = 'https://coral-mole-550185.hostingersite.com/';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000),
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  static DioHelper? _instance;

  DioHelper._();

  factory DioHelper() => _instance ??= DioHelper._();

  static Future<Map<String, dynamic>> login({required String name,required String password,required Map<String,dynamic> employeeChoice}) async {
    late Response response;
    try {
      print('$baseUrl${EndPoints.login}');
      FormData body = FormData.fromMap({
        'user_name': name,
        'password': password,
        'employee_choise': employeeChoice,
      });
      response = await _dio.post(EndPoints.login,
          data: body,);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getCoverages() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getCoverage);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getAgencies() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getAgencies);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getPartners() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getPartners);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getMedicalCenters() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getMedicalCenters);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getAccesses() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getAccesses);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getOffices() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getOffices);
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }


  static Future<Map<String, dynamic>> getWomenDoctorAppointments() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getWomenDoctorAppointments,
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }
  static Future<Map<String, dynamic>> getChildDoctorAppointments() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getChildDoctorAppointments,
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getDoctorVisit(int medicalRecordId) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getDoctorVisit(medicalRecordId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getRecordDetails(int medicalRecordId) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getRecordDetails(medicalRecordId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> createWomenDoctorVisit(
      {required String date,
      required String result,
      required int medicalRecordId,
      required bool healthEducation,
      required bool healthCare,
      required String activity}) async {
    late Response response;
    try {
      response = await _dio.post(EndPoints.createWomenDoctorVisit,
          data: {
            'date': date,
            'result': result,
            'medical_record_id': medicalRecordId,
            'activity': activity,
            'health_education': healthEducation,
            'health_care': healthCare,
          },
          options: Options(
            headers: AppHeadersUser.header,
          ));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> createChildDoctorVisit(
      {required String date,
      required String result,
      required int medicalRecordId,
        required bool healthEducation,
        required bool healthCare,
      required String activity}) async {
    late Response response;
    try {
      response = await _dio.post(EndPoints.createChildDoctorVisit,
          data: {
            'date': date,
            'result': result,
            'medical_record_id': medicalRecordId,
            'activity': activity,
            'health_education': healthEducation,
            'health_care': healthCare,
          },
          options: Options(
            headers: AppHeadersUser.header,
          ));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> getMedicalCenterMedicine() async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getMedicalCenterMedicine,
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }

  static Future<Map<String, dynamic>> orderMedicine({
    required int visitId,
    required int quantity,
    required int activityId,
    required int medicalCenterId,
  }) async {
    late Response response;
    try {
      FormData body = FormData.fromMap({
        'visit_id': visitId,
        'quantity': quantity,
        'activity_id': activityId,
        'medical_center_medicine_id': medicalCenterId,
      });
      response = await _dio.post(EndPoints.orderMedicine,
          data: body, options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }
  static Future<Map<String, dynamic>> getWomenVisitsNutrition({
    required int medicalRecordId,
  }) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getWomenVisitNutrition(medicalRecordId: medicalRecordId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error){
      return error.response!.data;
    }
  }
  static Future<Map<String, dynamic>> getChildVisitsNutrition({
    required int medicalRecordId,
  }) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getChildVisitNutrition(medicalRecordId: medicalRecordId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }
  static Future<Map<String, dynamic>> getChildVisitMedicine({
    required int visitId,
  }) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getChildVisitMedicine(visitId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }
  static Future<Map<String, dynamic>> getWomenVisitMedicine({
    required int visitId,
  }) async {
    late Response response;
    try {
      response = await _dio.get(EndPoints.getWomenVisitMedicine(visitId),
          options: Options(headers: AppHeadersUser.header));
      return response.data;
    } on DioException catch (error) {
      return error.response!.data;
    }
  }
}
