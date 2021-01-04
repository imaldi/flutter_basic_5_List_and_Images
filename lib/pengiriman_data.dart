import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class News{
  final String title;
  final String description;
  News(this.title, this.description);
}

class NewsScreen extends StatelessWidget {
  final List<News> news = List.generate(10, (index) => News('Judul Berita $index',
  'Detail isi berita ke $index'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Berita'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(news[index].title),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => NewsDetailScreen(news : news[index])));
              },
            );
          }
      ),
    );
  }
}

class NewsDetailScreen extends StatelessWidget {
  final News news;
  NewsDetailScreen({Key key,@required this.news}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(news.description),
      ),
    );
  }
}

