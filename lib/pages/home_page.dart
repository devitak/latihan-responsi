import 'package:flutter/material.dart';
import 'package:latihanresponsidevita/pages/reports_page.dart';

import 'blog_page.dart';
import 'news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Flight News'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildListItem(
              context,
              'News',
              'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites.',
              NewsPage(),
            ),
            _buildListItem(
              context,
              'Blog',
              'Blog often provide a more detailed of launches and missions. A must-have for the serious spaceflight enthusiast.',
              BlogPage(),
            ),
            _buildListItem(
              context,
              'Report',
              'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
              ReportPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context,
      String title,
      String description,
      Widget page,
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => page),
        );
      },
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
