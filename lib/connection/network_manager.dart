import 'package:dio/dio.dart';

import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_details.dart';
import 'package:project_d2d/model/staff_profile.dart';
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
    });

    SessionsManager.getUserId().then((value) {
      userId = value ?? 0;
      print("UserIdNM${userId}");
    });

     SessionsManager.getStaffId().then((value) {
      staffId = value ?? 0;
      
    });
  }

  Future<BaseResponse<List<User>>> userLogin(Map<String, dynamic> map) {
    print("error_response1${map}");
    return call(networkConnection.userLogin(map));
  }

  Future<BaseResponse> newRegister(Map<String, dynamic> map) {
    return call(networkConnection.newRegister(map));
  }

  Future<BaseResponse> forgotPasswordOTPSend(Map<String, dynamic> map) {
    return call(networkConnection.forgotPasswordOTPSend(map));
  }

  Future<BaseResponse> verifyOTP(Map<String, dynamic> map) {
    return call(networkConnection.verifyOTP(map));
  }

   Future<BaseResponse> resetPassword(Map<String, dynamic> map) {
    return call(networkConnection.resetPassword(map));
  }

   Future<BaseResponse<List<StaffProfile>>> staffProfile( String userToken, String sp, int staffId) {
    return call(networkConnection.staffProfile(userToken, sp, staffId ));
  }

  Future<BaseResponse<List<JobDetails>>> getJobDetails(String sp, int staffId,
      String searchKeyword, String jobStatus, String token) {
    return call(networkConnection.getJobDetails(
        sp, staffId, searchKeyword, jobStatus, token));
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
            print("error_msg${error.response?.data}");
            if (error.response?.statusCode == 400) {
              print(error.response?.data);
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
