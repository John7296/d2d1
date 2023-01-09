import 'package:project_d2d/model/staff_profile.dart';

class DataManager {
   static final DataManager _singleton = DataManager._internal();
  DataManager._internal();
  static DataManager get shared => _singleton;


  List<StaffProfile>? thisuser;
}