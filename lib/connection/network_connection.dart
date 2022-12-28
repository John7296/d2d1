import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/login_customer.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

 part 'network_connection.g.dart';


@RestApi(baseUrl: "https://wpr.intertoons.net/d2dApi/")

abstract class NetworkConnection {
  factory NetworkConnection(Dio dio, {String? baseUrl}) {
    if (kDedebug) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return _NetworkConnection(dio);
  }

  
  @FormUrlEncoded()
  @POST("Default.aspx")
  Future<BaseResponse<LoginCustomer>> userLogin(
      @Body() Map<String, dynamic> map);
  
}


