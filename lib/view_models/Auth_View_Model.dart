import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/Auth_Repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context) async {

    setLoading(true);
    _myRepo.loginApi(data).then((value){
    setLoading(false);
    Navigator.pushNamed(context, RoutesName.home);
        Utils.flushBarErrorMessage('Login Successfully', context,Colors.green);
      if(kDebugMode){
        print( 'Login $value');
      }
    }).onError((error, stackTrace){
        Utils.flushBarErrorMessage(error.toString(), context,Colors.red);
    setLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });

  }


  Future<void> signUpApi(dynamic data, BuildContext context) async {

    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value){
      setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarErrorMessage('Login Successfully', context,Colors.green);
      if(kDebugMode){
        print( 'signup $value');
      }
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessage(error.toString(), context,Colors.red);
      setSignUpLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });

  }


}