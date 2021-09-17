import 'package:flutter/material.dart';

import '../date_write_widget.dart';
import 'article_title_description.dart';

class ArticleBody extends StatefulWidget {
  const ArticleBody({Key? key}) : super(key: key);

  @override
  _ArticleBodyState createState() => _ArticleBodyState();
}

class _ArticleBodyState extends State<ArticleBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          date_writer(),
          ArticleTitleDescription(),
        ],
      ),
    );
  }
}
