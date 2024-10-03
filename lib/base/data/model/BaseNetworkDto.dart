import 'dart:convert';

abstract class BaseNetworkDto {
  Map<String, dynamic> toJson();
  String toJsonString() {
    return jsonEncode(toJson());
  }
}

// Request class for headlines
class HeadlineRequest extends BaseNetworkDto {
  final String country;
  final String apiKey;

  HeadlineRequest({required this.country, required this.apiKey});

  @override
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'apiKey': apiKey,
    };
  }
}

// Source class
class Source extends BaseNetworkDto {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// Articles class
class Articles extends BaseNetworkDto {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

// News response class
class NewsResponse extends BaseNetworkDto {
  final String? status;
  final int? totalResults;
  final List<Articles> articles;

  NewsResponse({this.status, this.totalResults, required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    var articlesFromJson = json['articles'] as List<dynamic>;
    List<Articles> articlesList = articlesFromJson
        .map((articleJson) => Articles.fromJson(articleJson))
        .toList();

    return NewsResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: articlesList,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }
}