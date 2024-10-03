import 'package:dio/dio.dart';
import 'package:news_app_demo_flutter/base/data/model/BaseNetworkDto.dart';

import '../infra/DioInterceptor.dart';
import '../infra/HttpRequester.dart';

abstract class NewsApi {
  Future<NewsResponse> getHeadline(HeadlineRequest request);
}

class NewsApiImpl implements NewsApi {
  final Dio dio;
  final baseUrl = 'https://newsapi.org';

  NewsApiImpl(this.dio) : super() {
    this.dio.interceptors.add(CustomInterceptor(baseUrl: baseUrl));
  }

  @override
  Future<NewsResponse> getHeadline(HeadlineRequest request) async {
    return await getRequest(
      '$baseUrl/v2/top-headlines',
      dio,
      request,
      (response) {
        var returnVal = NewsResponse.fromJson(response);
        return returnVal;
      },
    );
  }
}
