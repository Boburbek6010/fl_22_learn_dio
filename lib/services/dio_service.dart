import 'dart:developer';

import 'package:dio/dio.dart';

class DioService{

  static final _options = BaseOptions(

  );

  static final _dio = Dio(_options);

  static Future<List?> fetchData()async{
    Response response = await _dio.get("https://jsonplaceholder.typicode.com/users");
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.data;
    }else{
      return null;
    }
  }

}