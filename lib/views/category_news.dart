import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews(Category);
  }
  getCategoryNews(category) async {
    CategoryNewsClass newsClass =  CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Flutter"),
          Text("News", 
          style: TextStyle(
            color:Colors.blue
          )
          ),
        ],),
        actions:<Widget> [
          Opacity(
            opacity:0,
                      child: Container(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Icon(Icons.save)),
          )
        ],
      ),
      body:  _loading ? Center(
        child: Container(
          child:CircularProgressIndicator(),
          ),
      ):
        SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:15),
        child:Column(
          children:<Widget> [
            Container(
                padding: EdgeInsets.only(top:16),
                child:ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                    return BlogTile(
                      ImageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                    );
                  }
                  ),
            )
                ]
        )
      )
    )
    );
  }
}
class BlogTile extends StatelessWidget {

  final String ImageUrl, title, description, url;
  BlogTile({@required this.ImageUrl, @required this.title, @required this.description, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            blogUrl: url,
          )
          ));
      },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children:<Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(ImageUrl)
              ),
            SizedBox(height:7),
            Text(title,style: TextStyle(
              fontSize:18,
              color:Colors.black87,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(height:7),
            Text(description,style:TextStyle(
              color: Colors.black54
            )),
        ],
        ),
      ),
    );
  }
}