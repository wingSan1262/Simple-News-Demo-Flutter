import 'package:news_app_demo_flutter/base/data/model/BaseNetworkDto.dart';

import '../../basecomponent/BaseCubit.dart';
import '../../data/api/NewsApi.dart';

class Getnewsheadlinecubitcase extends BaseCubit<HeadlineRequest, NewsResponse> {
  final NewsApi api;
  Getnewsheadlinecubitcase(this.api) : super();
  @override
  void execute(HeadlineRequest request) {
    process(() async {
      return await api.getHeadline(request);
    });
  }
}