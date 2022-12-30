import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_details.dart';
import 'package:project_d2d/model/user.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_connection.g.dart';

@RestApi(baseUrl: 'https://wpr.intertoons.net/d2dApi')
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
  @POST("Default")
  Future<BaseResponse<User>> userLogin(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET('d2dApi')
  Future<BaseResponse<List<JobDetails>>> getJobDetails(
    @Header("token") String? token,
    @Query("staffId") int? staffId,
    @Query("sp") String? sp,
    @Query("searchKeyword") String? searchKeyword,
    @Query("jobStatus") String? jobStatus,
  );
}
