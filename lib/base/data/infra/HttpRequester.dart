import 'dart:convert';
import 'package:dio/dio.dart' as DIO;
import 'package:news_app_demo_flutter/base/data/model/BaseNetworkDto.dart';
import 'LoggerUtils.dart';

Future<Return> getRequest<Request extends BaseNetworkDto, Return extends BaseNetworkDto>(
    String url,
    DIO.Dio dio,
    Request request,
    Return Function(Map<String, dynamic>) fromJson,
    ) async {
  try {
    logUri("get", url);
    logRequest(request.toJsonString());
    Map<String, dynamic> queryParams = request.toJson();
    final response = await dio.get(
      url,
      queryParameters: queryParams,
    );
    return processResponse(response, fromJson);
  } catch (e) {
    throw processException(e);
  }
}

Future<Return> putRequest<Request extends BaseNetworkDto, Return extends BaseNetworkDto>(
    Request request,
    String url,
    DIO.Dio dio,
    Return Function(Map<String, dynamic>) fromJson,
    ) async {
  try {
    logUri("put", url);
    logRequest(request.toJsonString());
    final response = await dio.put(
      url,
      data: jsonEncode(request.toJson()),
    );
    return processResponse(response, fromJson);
  } catch (e) {
    throw processException(e);
  }
}

Future<Return> postRequest<Request extends BaseNetworkDto, Return extends BaseNetworkDto>(
    Request request,
    String url,
    DIO.Dio dio,
    Return Function(Map<String, dynamic>) fromJson,
    ) async {
  try {
    logUri("post", url);
    logRequest(request.toJsonString());
    final response = await dio.post(
      url,
      data: jsonEncode(request.toJson()),
    );
    return processResponse(response, fromJson);
  } catch (e) {
    throw processException(e);
  }
}

Return processResponse<Return extends BaseNetworkDto>(
    DIO.Response response,
    Return Function(Map<String, dynamic>) fromJson,
    ) {
  if (response.statusCode == 200) {
    var result = fromJson(response.data);
    logSuccess(result.toJsonString());
    return result;
  } else {
    var responseData = response.data;
    var message = responseData['message'];
    logNon200(response, message);
    throw Exception('Failed to load data: $message');
  }
}


processException(e) {
  logCommonException(e);
  var message = "";
  if (e is DIO.DioException) {
    message = e.message ?? "";
  } else if (e is Exception) {
    message = e.toString();
  }
  // limit message to 72 char max
  if (message.length > 72) {
    message = message.substring(0, 72);
  }
  return Exception('Error: ${message}');
}
