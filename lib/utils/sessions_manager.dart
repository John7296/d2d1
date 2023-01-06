import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager {
  static const String onBoardKey = "onBoardKey";
  static const String userToken = "userToken";
  static const String userId = "userId";
  static const String staffId = "staffId";
  static const String jobId = "jobId";
  static const String timesheetId = "timesheetId";

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userToken);
  }

  static void saveUserToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userToken, data);
  }

  static void saveUserId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(userId, data);
  }

  static Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userId);
  }

  static void saveStaffId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(staffId, data);
  }

  static Future<int?> getStaffId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(staffId);
  }

  static void saveOnBoarded(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(onBoardKey, data);
  }

     static void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
  }

    static void saveJobId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(jobId, data);
  }

  static Future<int?> getJobId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(jobId);
  }

      static void saveTimesheetId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(timesheetId, data);
  }

  static Future<int?> getTimesheetId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(timesheetId);
  }
}
