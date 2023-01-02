import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/job_details.dart';
import 'package:project_d2d/model/job_request.dart';
import 'package:project_d2d/model/payment.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/model/timesheet_banner.dart';
import 'package:project_d2d/model/training_status.dart';
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

  
  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<List<User>>> userLogin(
    //  @Header("Content-Length") String? length,
    //     @Header("Host") String? host,
   @Body() Map<String, dynamic> map);

 
  @POST("d2dApi/Default.aspx")
  Future<BaseResponse> newRegister(
      @Body() Map<String, dynamic> map);

@POST("d2dApi/Default.aspx")
  Future<BaseResponse> forgotPasswordOTPSend(
   @Body() Map<String, dynamic> map
  );

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse> verifyOTP(
     
   @Body() Map<String, dynamic> map
  );

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse> resetPassword(
    @Header("token") String? useroken, 
   @Body() Map<String, dynamic> map
  );
   
     @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<StaffProfile>>> staffProfile( 
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,
     
  );

  @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<TrainingStatus>>> trainingStatus( 
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,
     
  );

  @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<TimesheetBanner>>> timeSheetBanner( 
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,
     
  );

   @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<JobRequest>>> recentJobRequest( 
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,
     
  );

  @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<Payment>>> paymentHistory( 
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,
     
  );


  @FormUrlEncoded()
  @GET('sp=getJobsByStaffId&staffId=13&searchKeyword=&jobStatus=Active')
  Future<BaseResponse<List<JobDetails>>> getJobDetails(
    @Header("token") String? token,
    @Query("staffId") int? staffId,
    @Query("sp") String? sp,
    @Query("searchKeyword") String? searchKeyword,
    @Query("jobStatus") String? jobStatus,
  );
}
