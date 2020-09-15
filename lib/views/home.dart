import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

List<CategoryModel> categories = new List<CategoryModel>(); 
List<ArticleModel> articles = new List<ArticleModel>();

bool _loading = true;
 @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews() async {
    News newsClass =  News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black45,
        //toolbarHeight: 40,
        elevation: 0.0,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Flutter",style: TextStyle(color:Colors.red),),
          Text("News", 
          style: TextStyle(
            color:Colors.blue
          )
          ),
        ],)
      ),
      body: _loading ? Center(
        child: Container(
          child:CircularProgressIndicator(),
          ),
      ):
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:15),
          child: Column(
            children:<Widget> [
              Container(
                padding: EdgeInsets.symmetric(horizontal:15),
                height: 70,
                child:ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return CategoryTile(
                      ImageUrl: categories[index].ImageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  },
                )
              ),
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
                  )
              ),
            ],
            )
      ),
        ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String ImageUrl,categoryName;
  CategoryTile({this.ImageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context) => CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));
      },
          child: Container(
        margin: EdgeInsets.only(right: 17),
        child: Stack(
          children:<Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                imageUrl: ImageUrl, width: 120, height:60, fit: BoxFit.cover,
                )
                ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height:60,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(7),
                color: Colors.black45,
              ),
              child:Text(categoryName, style:TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:Colors.white
              ))
            )
          ],
        ),
      ),
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