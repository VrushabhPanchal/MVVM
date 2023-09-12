

import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/AppUrls.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiResponse();

  Future<dynamic> loginApi(dynamic data)  async {

    try{

      dynamic respones = await _apiServices.getPostApiResponse(AppUrls.loginEndPoint, data);
      return respones;

  }catch(e){
      return e;
  }

}
  Future<dynamic> resgisterApi(dynamic data)  async {

    try{

      dynamic respones = await _apiServices.getPostApiResponse(AppUrls.registerEndPoint, data);
      return respones;

    }catch(e){
      return e;
    }

  }



}