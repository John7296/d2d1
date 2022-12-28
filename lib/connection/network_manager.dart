import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_d2d/connection/network_connection.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/login_customer.dart';




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


 Future<BaseResponse<LoginCustomer>> userLogin(Map<String, dynamic> map) {
    return call(networkConnection.userLogin(map));
  }

  

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
