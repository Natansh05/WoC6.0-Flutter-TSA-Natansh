import 'package:flutter/material.dart';
import 'package:stocks_app/services/newsApi_services2.dart';
import 'package:stocks_app/src/common_widgets/drawer.dart';
import 'package:stocks_app/src/common_widgets/news_tile.dart';
import '../features/authentication/models/article_model2.dart';

class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewsApi client = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onProfileTap: () {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'N E W S',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If an error occurred
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // If data is available
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (BuildContext context, int index) {
                // Here, you can build the UI for each article
                Article article = articles[index];
                return customListTile(article);
              },
            );
          } else {
            // If no data available
            return const Center(
              child: Text('No articles found.'),
            );
          }
        },
      ),
    );
  }
}
