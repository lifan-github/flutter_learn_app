  import 'package:shared_preferences/shared_preferences.dart';

  SharedPreferences preferences;

  Future<void> getSharedPreferences() async {
    if(preferences == null){
      preferences = await SharedPreferences.getInstance();
    }else {
      return;
    }
}