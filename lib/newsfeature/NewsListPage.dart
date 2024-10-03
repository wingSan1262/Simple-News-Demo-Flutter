import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo_flutter/base/Widgets/ContentNews.dart';
import 'package:news_app_demo_flutter/base/data/model/BaseNetworkDto.dart';
import 'package:news_app_demo_flutter/base/dialogs/ErrorDialog.dart';
import 'package:news_app_demo_flutter/base/domain/usecase/GetNewsHeadlineCubitCase.dart';

import '../base/model/ResourceState.dart';
import 'NewsDetailPage.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  ResourceState<NewsResponse> newsData = ResourceState();
  List<Articles> get articleList => newsData.data?.articles ?? [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      fetchNews();
    });
  }

  void fetchNews() {
    context.read<Getnewsheadlinecubitcase>().execute(HeadlineRequest(
        country: 'us', apiKey: 'bd3e283759ad4ac5a2adefbf32356380'));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<Getnewsheadlinecubitcase, ResourceState<NewsResponse>>(
          listener: (context, state) {
            setState(() {
              if (state.isError) {
                showErrorDialog(context, state.error?.errorMessage ?? '',
                    'Error', null, null);
              }
              newsData = state;
            });
          },
        ),
      ],
      child: Scaffold(
          body: RefreshIndicator(
        onRefresh: () async {
          fetchNews();
          await Future.delayed(Duration(seconds: 2));
        },
        child: ListView.builder(
          itemCount: articleList.length ?? 0,
          itemBuilder: (context, index) {
            var article = articleList[index] ?? Articles();
            return ContentNews(
                article: article,
                onSelectTask: (art) {
                  // navigate to detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(currentNews: art),
                    ),
                  );
                },
                isRight: index.isEven);
          },
        ),
      )),
    );
  }
}
