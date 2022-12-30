import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager{

    static const String onBoardKey = "onBoardKey";

     static void saveOnBoarded(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(onBoardKey, data);
  }

}