import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController{
late SharedPreferences prefs ;
SharedPrefController ._init() ;
static SharedPrefController? _instance ;

factory SharedPrefController(){
  return  _instance ??= SharedPrefController ._init() ;
}

initpref() async {
  prefs = await SharedPreferences.getInstance();
}


 Future<bool> setData({Key,value}) async {
    if (value is int) {
    return  await prefs.setInt(Key, value);
    }else if (value is double) {
     return await prefs.setDouble(Key, value);
    }else if (value is bool) {
    return  await prefs.setBool(Key, value);
    }else if (value is String) {
    return  await prefs.setString(Key, value);
    }
    return false ;
  }

   T? getData<T>({key}){
    return prefs.get(key) as T? ;
  }

  Future<bool> remove({Key}) async {
  return  await prefs.remove(Key);
  }

 
  Future<bool> clear() async {
  return  await prefs.clear();
  }

}














