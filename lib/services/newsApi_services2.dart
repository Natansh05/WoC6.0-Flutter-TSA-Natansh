// now lets make HTTP request services
// this class will allow us to perform simple get HTTP request
// from the API and get the Articles and then return a list f Articles

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stocks_app/src/features/authentication/models/article_model2.dart';

class NewsApi {
  //adding and endpoint url
  //endpoint urls represent various testcases type things when how would api respond
  // if you lookout for particular types of information

  //directly just take the url without api key and parse it to make it uri
  final _endPointUrl = Uri.parse(
    "https://newsapi.org/v2/top-headlines?country=in&category=business",
  );

  //key parameters we want news related to business only not general news also pass the api key(not recommended due to safety but works for now)
  final _headers = {
    "X-Api-Key": "e8b82a9716d5431f9cf3b6789b94c9dc",
    "category": "business",
  };

  //make a list to store the articles
  List<Article> _articles = [];

  //getter for the articles
  Future<List<Article>> getArticle() async {
    //Take Future<void> instead of Future<List<Article>> because we are not returning anything

    //make a get request to the api and it should always be in try block not in if and else as it may result in crash of application if data is not received
    //make the use of 'final' keyword for most of the variables as it is a good practice
    try {
      //now we're just passing the url and headers to the get method
      final response = await http.get(_endPointUrl, headers: _headers);

      //decoding the json data and storing it in a map and then extracting the articles from the map
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      //extracting the articles from the map(missing step in your code) as the json data has more data like all kinds of news but we only want business news
      //so we need to extract the articles from the map

      final articleData =
          List<Map<dynamic, dynamic>>.from(extractedData['articles']);

      //mapping the articles to the list of articles we created
      final loadedArticles = articleData
          .map(
            (data) => Article(
              id: data['publishedAt'] ?? "",
              title: data['title'] ?? "",
              author: data['author'] ?? "",
              content: data['content'] ?? "",
              description: data['description'] ?? "",
              url: data['url'] ?? "",
              urlToImage: data['urlToImage'] ?? "",
              publishedAt: DateTime.parse(data['publishedAt']),
            ),
          )
          .toList();
      return loadedArticles;
      // _articles = loadedArticles;
      // Provider.of<Article>(context, listen: false).notifyListeners();
    } catch (error) {
      // no need for if condition on particular error code as we are using try catch block so it will catch all the errors
      rethrow;
    }
  }
}
