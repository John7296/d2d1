import 'package:dio/dio.dart';

import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_details.dart';
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

  Future<BaseResponse<List<User>>> userLogin(Map<String, dynamic> map) {
    print("error_response1${map}");
    return call(networkConnection.userLogin(map));
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
