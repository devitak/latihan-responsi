import 'package:flutter/material.dart';
import 'package:latihanresponsidevita/data/data_blog.dart';
import 'package:latihanresponsidevita/detail_page/detail_blog.dart';
import 'api_data_source.dart';


class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _PageListBlogState();
}

class _PageListBlogState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: _buildListBlogBody(),
    );
  }

  Widget _buildListBlogBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadBlog(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            DataBlog detailArtikel =
            DataBlog.fromJson(snapshot.data);
            return _buildSuccessSection(detailArtikel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text('gagal');
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(DataBlog data){
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemBlog(data.results![index]);
        }
    );
  }

  Widget _buildItemBlog(Results detailTulisan){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailPage(detailTulisan: detailTulisan),
          ),
        );
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(detailTulisan.imageUrl!),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detailTulisan.title!),
                Text(detailTulisan.publishedAt!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
