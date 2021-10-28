import 'dart:convert';
import 'package:newsapi/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  var client = new http.Client();
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=4ecdb4382be54edd80da58349bd49972";

    //var response = await http.get(Uri.parse(url));
    var response = await client.get(Uri.parse(url));
    var jasonData = jsonDecode(response.body);
    if (jasonData["status"] == "ok") {
      jasonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            //author: element["author"],
            title: element["title"],
            //content: element["content"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            // publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  var client = new http.Client();
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=4ecdb4382be54edd80da58349bd49972 ";

    //var response = await http.get(Uri.parse(url));
    var response = await client.get(Uri.parse(url));
    var jasonData = jsonDecode(response.body);
    if (jasonData["status"] == "ok") {
      jasonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            //author: element["author"],
            title: element["title"],
            //content: element["content"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            // publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
