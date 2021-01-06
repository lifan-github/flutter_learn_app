import 'package:dio/dio.dart';
import 'package:flutter_learn_app/http/api_config.dart';

///************* 界面调用出现bug */
Future<Response> getUserList() async {
  Response response = await Dio().get(ApiConfig.GET_USER_LIST);
  return response;
}