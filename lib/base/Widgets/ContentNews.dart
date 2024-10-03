import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/BaseNetworkDto.dart';
import 'BackgroundGradationBox.dart';
import 'ShowSlideLeft.dart';

class ContentNews extends StatelessWidget {
  final Articles article;
  final Function(Articles) onSelectTask;
  final bool isRight;

  const ContentNews({
    Key? key,
    required this.article,
    required this.onSelectTask,
    required this.isRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowSlideLeft(
      delay: Duration(milliseconds: 200),
      isFromRight: isRight,
      child: GestureDetector(
        onTap: () => onSelectTask(article),
        child: Container(
          height: 200,
          alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
          child: Stack(
            children: [
              // Background Image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Background Gradation Box
              BackgroundGradationBox(
                isRight: isRight,
                style: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Align(
                  alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    article.title ?? '',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}