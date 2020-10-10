import 'package:flutter/material.dart';
import 'package:flutter_ui_test/news/loading_list_screen.dart';
import 'package:flutter_ui_test/news/providers/news_provider.dart';
import 'package:flutter_ui_test/news/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {

  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            Text(
              ' App',
              style: TextStyle(color: Colors.orange),
            )
          ],
        )),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: Provider.of<News>(context).getNews(),
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: LoadingListPage());
                } else {
                  if (dataSnapshot.error != null) {
                    // ...
                    // Do error handling stuff
                    return Center(
                      child: LoadingListPage(),
                    );
                  } else {
                    return Consumer<News>(
                      builder: (ctx, news, child) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: news.newsArticles.length,
                        itemBuilder: (ctx, i) => NewsTile(
                          posturl: news.newsArticles[i].url,
                          title: news.newsArticles[i].title,
                          content: news.newsArticles[i].content,
                          imgUrl: news.newsArticles[i].urlToImage,
                          desc: news.newsArticles[i].description,
                        ),
                      ),
                    );
                  }
                }
              })),
    );
  }
}
