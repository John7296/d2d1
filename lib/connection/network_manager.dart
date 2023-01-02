import 'package:dio/dio.dart';

import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/alert.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/applyjob.dart';
import 'package:project_d2d/model/approve_timesheet.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/canceljob.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/model/timesheetdetails.dart';
import 'package:project_d2d/model/user.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() {
    return _singleton;
  }

  static NetworkManager get shared => _singleton;

  NetworkManager._internal();

  Dio? dio;
  late NetworkConnection networkConnection;

  init() {
    dio = Dio();
    networkConnection = NetworkConnection(dio!);
  }

  Future<BaseResponse<User>> userLogin(Map<String, dynamic> map) {
    return call(networkConnection.userLogin(map));
  }

  Future<BaseResponse<List<Job>>> getJob(String token, String sp, int staffId,
      String searchKeyword, String jobStatus) {
    return call(networkConnection.getJob(
      token,
      sp,
      staffId,
      searchKeyword,
      jobStatus,
    ));
  }

  Future<BaseResponse<Alert>> alerMessages(
      String token, String sp, int staffId, String outputMode) {
    return call(
        networkConnection.alertMessages(token, sp, staffId, outputMode));
  }

  Future<BaseResponse<List<JobDetails>>> getJobDetails(
      String token, String sp, int staffId, int jobid) {
    return call(networkConnection.getJobDetails(
      token,
      sp,
      staffId,
      jobid,
    ));
  }

  Future<BaseResponse<List<TimeSheet>>> timeSheet(
      String token, String sp, int staffId) {
    return call(networkConnection.timeSheet(
      token,
      sp,
      staffId,
    ));
  }

  Future<BaseResponse<ApplyJob>> applyJob(
      String token, Map<String, dynamic> map) {
    return call(networkConnection.applyJob(token, map));
  }

  Future<BaseResponse<CancelJob>> cancelJob(
      String token, Map<String, dynamic> map) {
    return call(networkConnection.cancelJob(token, map));
  }

    Future<BaseResponse<List<TimeSheetDetails>>> gettimeSheetDetails(
      String token, String sp, int staffId) {
    return call(networkConnection.gettimeSheetDetails(
      token,
      sp,
      staffId,
    ));
  }

    Future<BaseResponse<ApproveTimeSheet>> approveTimeSheet(
      String token, Map<String, dynamic> map) {
    return call(networkConnection.approveTimeSheet(token, map));
  }

//  Future<BaseResponse<List<JobDetails>>> getJobDetails(Map<String, dynamic> map) {
//     return call(networkConnection.getJobDetails(map["sp"], map["staffId"],map["searchKeyword"],map["jobStatus"]));
//   }

  Future<T> call<T>(Future<T> call) async {
    T response;

    try {
      response = await call;
    } catch (error) {
      if (error is DioError) {
        String _errorMessage = "";

        switch (error.type) {
          case DioErrorType.cancel:
            _errorMessage = "Request was cancelled";
            break;
          case DioErrorType.connectTimeout:
            _errorMessage = "Connection timeout";
            break;
          case DioErrorType.other:
            if (error.message.contains('Failed host lookup')) {
              _errorMessage = "Please check your internet connection";
            } else {
              _errorMessage = "Something went wrong ${error.message}";
            }
            break;
          case DioErrorType.receiveTimeout:
            _errorMessage = "Receive timeout in connection";
            break;
          case DioErrorType.response:
            _errorMessage = error.response?.data;

            if (error.response?.statusCode == 400) {
              // print(error.response?.data);
              print("error_msg${error.response?.data}");
            }

            break;
          case DioErrorType.sendTimeout:
            _errorMessage = "Receive timeout in send request";
            break;
        }

        throw (_errorMessage);
      }

      throw ("$error");
    }

    return response;
  }
}
