import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/category_bloc/category_bloc.dart';
import 'package:travelv2/backend/category_bloc/category_events.dart';
import 'package:travelv2/backend/model/category_model.dart';
import 'package:travelv2/backend/category_bloc/category_states.dart';

import 'components/Home/recent_news.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key, this.categoryInfo}) : super(key: key);
  final Map? categoryInfo;

  @override
  _categoryPageState createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  late CategoryBloc categoryBloc;

  @override
  void initState() {
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(FetchCategoryPosts());
    categoryBloc.categoryName = widget.categoryInfo!["categoryName"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.categoryInfo!["categoryName"],
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowIosBack,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 1000,
        child: BlocBuilder<CategoryBloc, CategoryState>(
            // stream: newsBloc.articleStream,
            builder: (context, state) {
          if (state is CategoryLoadingState) {
            return CircularProgressIndicator();
          } else if (state is CategoryPostsFetchSuccess) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.article.length,
                itemBuilder: (BuildContext context, int index) {
                  var article = state.article[index];
                  return Align(
                    heightFactor: 1.2,
                    child: InkWell(
                      child: recentNewsCard(
                          image: article.image,
                          title: article.title,
                          date: article.date,
                          readTime: article.readTime,
                          press: () {}),
                      onTap: () => {
                        Navigator.of(context)
                            .pushNamed('/article_page', arguments: {
                          'articleID': article.articleID,
                          'image': article.image,
                          'title': article.title,
                          'Description': article.Description,
                          'readTime': article.readTime,
                          'date': article.date,
                          'writerID': article.writerID,
                        })
                      },
                    ),
                  );
                });
          }
          return const Center(
              child: Text(
            "No data",
            style: TextStyle(fontSize: 30),
          ));
        }),
      ),
    );
  }
}
