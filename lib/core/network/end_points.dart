import '../storage_handler/storage_handler.dart';

class EndPoints {
static String login = 'api/login';
static String getCoverage = 'api/getCoverages';
static String getAgencies = 'api/getAgencies';
static String getAccesses = 'api/getAccesses';
static String getOffices = 'api/getOffices';
static String getPartners = 'api/getPartners';
static String getMedicalCenters = 'api/getMedicalCenters';
static String getChildDoctorAppointments = 'api/getChildDoctorAppointments';
static String getWomenDoctorAppointments = 'api/getWomenDoctorAppointments';
static String getDoctorVisit (int medicalRecordId)=> 'api/getDoctorVisitsByMedicalRecordId/$medicalRecordId';
static String getRecordDetails (int medicalRecordId)=> 'api/getRecordDetails/$medicalRecordId';
static String createChildDoctorVisit = 'api/createChildDoctorVisit';
static String createWomenDoctorVisit = 'api/createWomenDoctorVisit';
static String getWomenVisitMedicine (int visitId) => 'api/getWomenVisitMedicine/$visitId';
static String getChildVisitMedicine (int visitId) => 'api/getChildVisitMedicine/$visitId';
static String getMedicalCenterMedicine = 'api/getMedicalCenterMedicine';
static String orderMedicine = 'api/doctorMedicineOrder';
static String getChildVisitNutrition ({required int medicalRecordId})=> '/api/getChiledVisit/$medicalRecordId';
static String getWomenVisitNutrition({required int medicalRecordId}) => '/api/getWomenVisit/$medicalRecordId';
}
