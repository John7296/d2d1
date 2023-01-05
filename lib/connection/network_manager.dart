import 'package:dio/dio.dart';

import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/alert.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/applyjob.dart';
import 'package:project_d2d/model/approve_timesheet.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/canceljob.dart';
import 'package:project_d2d/model/forgot_password.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/model/job_request.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/model/payment.dart';
import 'package:project_d2d/model/settings.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/model/timesheet_banner.dart';
import 'package:project_d2d/model/timesheetdetails.dart';
import 'package:project_d2d/model/training_status.dart';
import 'package:project_d2d/model/user.dart';
import 'package:project_d2d/utils/sessions_manager.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() {
    return _singleton;
  }

  static NetworkManager get shared => _singleton;

  NetworkManager._internal();

  Dio? dio;
  late NetworkConnection networkConnection;
  late int? userId;
  late int? staffId;
  late String? userToken;

  init() {
    dio = Dio();
    networkConnection = NetworkConnection(dio!);
  }

  void refreshTokens() {
    SessionsManager.getUserToken().then((token) {
      token = (token ?? "");
      userToken = token.isEmpty ? "" : token;

      print("Token ${token}");
    });

    SessionsManager.getUserId().then((value) {
      userId = value ?? 0;
      print("userId ${userId}");
    });

    SessionsManager.getStaffId().then((value) {
      staffId = value ?? 0;
      print("staffId ${staffId}");
    });
  }

  Future<BaseResponse<List<User>>> userLogin(Map<String, dynamic> map) {
    return call(networkConnection.userLogin(map));
  }

  Future<BaseResponse> forgotPasswordOTPSend( Map<String, dynamic> map) {
    return call(networkConnection.forgotPasswordOTPSend(map));
  }

  Future<BaseResponse<List<StaffProfile>>> staffProfile(
      String userToken, String sp, int staffId) {
    return call(networkConnection.staffProfile(userToken, sp, staffId));
  }

  Future<BaseResponse<List<TrainingStatus>>> trainingStatus(
      String userToken, String sp, int staffId) {
    return call(networkConnection.trainingStatus(userToken, sp, staffId));
  }

  Future<BaseResponse<List<TimesheetBanner>>> timeSheetBanner(
      String userToken, String sp, int staffId) {
    return call(networkConnection.timeSheetBanner(userToken, sp, staffId));
  }

  Future<BaseResponse<List<JobRequest>>> recentJobRequest(
      String userToken, String sp, int staffId) {
    return call(networkConnection.recentJobRequest(userToken, sp, staffId));
  }

  Future<BaseResponse<List<Payment>>> paymentHistory(
      String userToken, String sp, int userId) {
    return call(networkConnection.paymentHistory(userToken, sp, userId));
  }

  Future<BaseResponse> newRegister(Map<String, dynamic> map) {
    return call(networkConnection.newRegister(map));
  }

  Future<BaseResponse> resetPassword(String token, Map<String, dynamic> map) {
    return call(networkConnection.resetPassword(token, map));
  }

   Future<BaseResponse> changePassword(String token, Map<String, dynamic> map) {
    return call(networkConnection.changePassword(token, map));
  }

   Future<BaseResponse> updateProfile(String token, Map<String, dynamic> map) {
    return call(networkConnection.updateProfile(token, map));
  }


  Future<BaseResponse> verifyOTP(Map<String, dynamic> map) {
    return call(networkConnection.verifyOTP(map));
  }

   Future<BaseResponse<List<Settings>>> settings(String sp) {
    return call(networkConnection.settings(sp));
  }

   Future<BaseResponse<List<AlertMessages>>> notifications(
      String token, String sp, int staffId) {
    return call(networkConnection.notifications(token, sp, staffId));
  }

  Future<BaseResponse<List<Job>>> getJob(String token, String sp,
      int staffId, String searchKeyword, String jobStatus) {
    return call(networkConnection.getJob(
      token,
      sp,
      staffId,
      searchKeyword,
      jobStatus,
    ));
  }

  Future<BaseResponse<Alert>> alerMessages(
      String token, String sp, String staffId, String outputMode) {
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

   Future<BaseResponse> deleteUser(String token, Map<String, dynamic> map) {
    return call(networkConnection.deleteUser(token, map));
  }

//  Future<BaseResponse<List<JobDetails>>> getJobDetails(Map<String, dynamic> map) {
//     return call(networkConnection.getJobDetails(map["sp"], map["staffId"],map["searchKeyword"],map["jobStatus"]));
//   }

  // Future<T> call<T>(Future<T> call) async {
  //   T response;

  //   try {
  //     response = await call;
  //   } catch (error) {
  //     if (error is DioError) {
  //       String _errorMessage = "";

  //       switch (error.type) {
  //         case DioErrorType.cancel:
  //           _errorMessage = "Request was cancelled";
  //           break;
  //         case DioErrorType.connectTimeout:
  //           _errorMessage = "Connection timeout";
  //           break;
  //         case DioErrorType.other:
  //           if (error.message.contains('Failed host lookup')) {
  //             _errorMessage = "Please check your internet connection";
  //           } else {
  //             _errorMessage = "Something went wrong ${error.message}";
  //           }
  //           break;
  //         case DioErrorType.receiveTimeout:
  //           _errorMessage = "Receive timeout in connection";
  //           break;
  //         case DioErrorType.response:
  //           _errorMessage = error.response?.data;

  //           if (error.response?.statusCode == 400) {
  //             // print(error.response?.data);
  //             print("error_msg${error.response?.data}");
  //           }

  //           break;
  //         case DioErrorType.sendTimeout:
  //           _errorMessage = "Receive timeout in send request";
  //           break;
  //       }

  //       throw (_errorMessage);
  //     }

  //     throw ("$error");
  //   }

  //   return response;
  // }



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
            // if (error.response?.statusCode == 401) {
            //   _errorMessage = "Session timeout";
            //   // DataManager.shared.onTokenExpired!();
            //   throw (_errorMessage);
            // }

            if (error.response?.statusCode == 401 ||
                error.response?.statusCode == 400) {
              if (error.response!.data["Data"] is Iterable) {
                for (Map m in error.response!.data["Data"]) {
                  _errorMessage = _errorMessage + m["Message"] + "\n";
                }
              } else {
                _errorMessage = "${error.response!.data["Message"] ?? ""}";
              }
              _errorMessage = _errorMessage.trim() == ""
                  ? "Unknown error"
                  : _errorMessage.trim();
              throw (_errorMessage);
            }

            if (error.response?.statusCode == 500) {
              try {
                if (error.response!.data["data"] != null) {
                  if (error.response!.data["data"]["go_to_cart"] != null) {
                    if (error.response!.data["data"]["go_to_cart"]) {
                      // DataManager.shared.onGotoCartFired!();
                    }
                  }
                }
              } catch (e) {}
            }

            _errorMessage = "${error.response!.data["message"] ?? ""}";

            error.response!.data["errors"]?.forEach((k, v) {
              _errorMessage = _errorMessage + "${v[0] ?? ""}\n";
            });

            _errorMessage = _errorMessage.trim() == ""
                ? "Unknown error"
                : _errorMessage.trim();
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
