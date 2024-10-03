
import 'package:flutter/foundation.dart';

void logUri(String uri, String method){
  if (!kReleaseMode) {
    print('Network Log Uri: $method $uri');
  }
}
void logRequest(String req){
  if (!kReleaseMode) {
    print('Network Log Request: ${req}');
  }
}

void logRequestQuery(String req){
  if (!kReleaseMode) {
    print('Network Log Request: ${req}');
  }
}

void logSuccess(String res){
  if (!kReleaseMode) {
    print('Network Log Response Success: ${res}');
  }
}

void logNon200(
    dynamic response,
    String message,
    ){
  if (!kReleaseMode) {
    print('Network Log Response Non200: ${response.toString()} , msg $message');
  }
}

void logCommonException(
    dynamic e,
    ){
  if (!kReleaseMode) {
    var message = "";
    if (e is Exception) {
      message = e.toString();
    }
    print('Network Log Exception: ${message}');
  }
}