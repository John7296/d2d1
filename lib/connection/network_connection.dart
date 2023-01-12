import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
import 'package:project_d2d/model/otp.dart';
import 'package:project_d2d/model/payment.dart';
import 'package:project_d2d/model/settings.dart';
import 'package:project_d2d/model/staff_profile.dart';
import 'package:project_d2d/model/timesheet.dart';
import 'package:project_d2d/model/timesheet_banner.dart';
import 'package:project_d2d/model/timesheetresponse.dart';
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
  Future<BaseResponse> newRegister(@Body() Map<String, dynamic> map);

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<List<ForgotPassword>>> forgotPasswordOTPSend(@Body() Map<String, dynamic> map);

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<List<Otp>>> verifyOTP(@Body() Map<String, dynamic> map);

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse> resetPassword(
      @Header("token") String? useroken, @Body() Map<String, dynamic> map);

      @POST("d2dApi/Default.aspx")
  Future<BaseResponse> changePassword(
    @Header("token") String? token, 
    @Body() Map<String, dynamic> map
  );

   @POST("d2dApi/Default.aspx")
  Future<BaseResponse> updateProfile(
    @Header("token") String? token, 
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
    @Query("userId") int? userId,
  );


   @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<Settings>>> settings(   
   @Query("sp") String? sp,    
  );

   @FormUrlEncoded()
   @GET("d2dApi")
  Future<BaseResponse<List<AlertMessages>>> notifications(   
    @Header("token") String? token,   
   @Query("sp") String? sp,
    @Query("staffId") int? staffId,   
  );


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
    @Query("staffId") String staffId,
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
  Future<BaseResponse<List<TimesheetBanner>>> timeSheet(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,
  );

  // @FormUrlEncoded()
  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<ApplyJob>> applyJob(
      @Header("token") String? token, @Body() Map<String, dynamic> map);

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<CancelJob>> cancelJob(
      @Header("token") String? token, @Body() Map<String, dynamic> map);

  @GET("d2dApi")
  Future<BaseResponse<TimeSheetResponse>> gettimeSheetDetails(
    @Header("token") String? token,
    @Query("sp") String sp,
    @Query("staffId") int staffId,
    @Query("jobId") int jobId,
    @Query("outputMode") String outputMode,
  );

  @POST("d2dApi/Default.aspx")
  Future<BaseResponse<ApproveTimeSheet>> approveTimeSheet(
      @Header("token") String? token, @Body() Map<String, dynamic> map);

      @POST("d2dApi/Default.aspx")
  Future<BaseResponse> deleteUser(
    @Header("token") String? token, 
    @Body() Map<String, dynamic> map
  );

    @POST("d2dApi/Default.aspx")
  Future<BaseResponse> supportRequest(
    @Header("token") String? token, 
    @Body() Map<String, dynamic> map
  );
}
