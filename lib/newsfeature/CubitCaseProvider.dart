import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo_flutter/base/data/api/NewsApi.dart';

import '../base/domain/usecase/GetNewsHeadlineCubitCase.dart';

NewsApi api = NewsApiImpl(Dio());

class ProviderCubitWidget extends StatelessWidget {
  final Widget app;
  const ProviderCubitWidget({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Getnewsheadlinecubitcase(api)),
        ],
        child: app
    );
  }
}