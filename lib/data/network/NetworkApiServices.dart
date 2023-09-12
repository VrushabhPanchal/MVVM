import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';

import 'BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponse extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson;
    try{

      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException {
      throw FetchDataException();
    }
    return responseJson;


  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try{

      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException {
      throw FetchDataException();
    }

    return responseJson;
  }

  dynamic returnResponse (http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic returnResponseJson = jsonDecode(response.body);
        return returnResponseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        default:
          throw FetchDataException('Error occurs while while communicating with server' + 'with status code '+ response.statusCode.toString());

    }

  }



}