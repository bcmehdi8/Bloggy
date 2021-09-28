// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/article_bloc/article_bloc.dart';
import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/backend/article_bloc/article_states.dart';
import 'package:travelv2/config/constants.dart';

class writerLatestPosts extends StatefulWidget {
  const writerLatestPosts({Key? key}) : super(key: key);

  @override
  _writerLatestPostsState createState() => _writerLatestPostsState();
}

class _writerLatestPostsState extends State<writerLatestPosts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: null,
            child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
              if (state is ArticleInitialState) {
                return CircularProgressIndicator();
              } else if (state is ArticleLoadingState) {
                return CircularProgressIndicator();
              } else if (state is FetchWriterPageData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: state.LatestPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.LatestPosts[index];
                      return Align(
                        heightFactor: 1.15,
                        child: InkWell(
                          child: latestWriterArticle(
                            image: data.image,
                            title: data.title,
                            date: data.date,
                            readTime: data.readTime,
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/article_page', arguments: {
                              'id': data.articleID,
                              'image': data.image,
                              'title': data.title,
                              'Description': data.Description,
                              'readTime': data.readTime,
                              'date': data.date,
                              'writerID': data.writerID,
                            });
                          },
                        ),
                      );
                    });
              } else if (state is ErrorState) {
                return Center(
                  child: Text("RROR"),
                );
              }
              return const Center(
                  child: Text(
                "No data",
                style: TextStyle(fontSize: 30),
              ));
            }),
          ),
        ],
      ),
    );
  }
}

class latestWriterArticle extends StatefulWidget {
  latestWriterArticle(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.readTime})
      : super(key: key);
  String image, title, date;
  int readTime;

  @override
  _latestWriterArticleState createState() => _latestWriterArticleState();
}

class _latestWriterArticleState extends State<latestWriterArticle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.115,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Container(
              width: size.width * 0.24,
              height: size.height * 0.95,
              decoration: BoxDecoration(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.image, fit: BoxFit.cover))),
          Container(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.6,
                  child: Text(
                    widget.title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                      fontFamily: 'Nunito Sans',
                      height: 1.3,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  widget.readTime.toString() + " Mins Read | " + widget.date,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
