import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_demo_flutter/base/Widgets/ShowFadeinSlideBottom.dart';
import 'package:news_app_demo_flutter/base/Widgets/ShowSlideLeft.dart';
import 'package:news_app_demo_flutter/base/data/model/BaseNetworkDto.dart';

class NewsDetailPage extends StatelessWidget {
  Articles currentNews;

  NewsDetailPage({Key? key, required this.currentNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Color(0xCC007AFF);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  currentNews.urlToImage ?? '',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ShowFadeInSlideBottom(
              delay: Duration(milliseconds: 200),
              child: Text(
                currentNews.title ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            if (currentNews.author != null) ...[
              ShowFadeInSlideBottom(
                delay: Duration(milliseconds: 200),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    currentNews.author ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
            if (currentNews.source?.name != null) ...[
              ShowFadeInSlideBottom(
                delay: Duration(milliseconds: 200),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    currentNews.source?.name ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
            ShowFadeInSlideBottom(
              delay: Duration(milliseconds: 200),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Text(
                  currentNews.description != null
                      ? '"${currentNews.description}"'
                      : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            ShowSlideLeft(
              delay: Duration(milliseconds: 200),
              isFromRight: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(
                  currentNews.content ?? '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
