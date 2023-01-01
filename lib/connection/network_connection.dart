import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_d2d/model/alert.dart';
import 'package:project_d2d/model/alert_messages.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job.dart';
import 'package:project_d2d/model/jobdetails.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/model/user.dart';
import 'package:project_d2d/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_connection.g.dart';

@RestApi(baseUrl: 'https://wpr.intertoons.net/')
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
  Future<BaseResponse<User>> userLogin(@Body() Map<String, dynamic> map);

  @GET("d2dApi")
  Future<BaseResponse<List<Job>>> getJob(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,
    @Query("searchKeyword") String searchKeyword,
    @Query("jobStatus") String jobStatus,
  );


    @GET("d2dApi")
  Future<BaseResponse<Alert>> alertMessages(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,
    @Query("outputMode") String outputMode,

  );

  @GET("d2dApi")
  Future<BaseResponse<List<JobDetails>>> getJobDetails(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,
    @Query("jobid") int jobid,

  );

      @GET("d2dApi")
  Future<BaseResponse<List<TimeSheet>>> timeSheet(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,


  );

}
