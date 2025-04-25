import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/news_data/get_news.dart';
import 'package:red_cell/core/widgets/My_header.dart';
import 'package:red_cell/views/main_layout/tabs/news/widgets/news_card.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(title: 'News'),
          FutureBuilder(
            future: GetNews().getNews('health'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      setState(() {

                      });
                      return Future(() {
                        print("refresh");
                      },);
                    },
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: NewsCard(newsDm: snapshot.data![index],),
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(
                  child: CircularProgressIndicator(color: ColorsManeger.red),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
