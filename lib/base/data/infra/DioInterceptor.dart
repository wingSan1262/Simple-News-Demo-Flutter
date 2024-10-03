import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';


class CustomInterceptor extends DIO.Interceptor {
  String baseUrl;
  CustomInterceptor({required this.baseUrl});

  @override
  void onRequest(
      DIO.RequestOptions options, DIO.RequestInterceptorHandler handler) {
    options.headers['X-Request-Id'] = Uuid().v4();
    options.responseType = DIO.ResponseType.json;
    // accept sen json
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';


    if(!kReleaseMode){
      // log header
      print('Network Log Headers: ${options.headers.toString()}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      DIO.Response response, DIO.ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DIO.DioError err, DIO.ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
