


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/models/UserModel.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_models/User_View_Model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();
    void CheckAuthentication(BuildContext context )async{

      getUserData().then((value) {
        if(value.token == 'null' || value.token == ''){
        Navigator.pushReplacementNamed(context, RoutesName.login);
        }
        else{
        Navigator.pushReplacementNamed(context, RoutesName.home);
        }
      }).onError((error, stackTrace) {
        if(kDebugMode){
          print(error.toString());
        }
      });

    }


}