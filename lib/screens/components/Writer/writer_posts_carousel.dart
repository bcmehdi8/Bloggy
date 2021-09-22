// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/bloc/article_bloc.dart';
import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/backend/states/article_states.dart';

class writerbody extends StatefulWidget {
  const writerbody({Key? key}) : super(key: key);

  @override
  _writerbodyState createState() => _writerbodyState();
}

class _writerbodyState extends State<writerbody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      child: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitialState) {
          return CircularProgressIndicator();
        } else if (state is ArticleLoadingState) {
          return CircularProgressIndicator();
        } else if (state is FetchSuccessList) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.article.length,
              itemBuilder: (BuildContext context, int index) {
                var data = state.article[index];
                return InkWell(
                  child: writer_posts_carousel(
                    image: data.image,
                    category: data.category,
                    title: data.title,
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
    );
  }
}

class writer_posts_carousel extends StatefulWidget {
  final String? image, category, title;
  final int? readTime;

  const writer_posts_carousel({
    Key? key,
    this.image,
    this.category,
    this.title,
    this.readTime,
  }) : super(key: key);

  @override
  _writer_posts_carouselState createState() => _writer_posts_carouselState();
}

class _writer_posts_carouselState extends State<writer_posts_carousel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          height: size.height * 0.35,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${widget.image}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  bottom: 5,
                  right: 5,
                  height: 110,
                  width: size.width * 0.575,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${widget.category} | ${widget.readTime} Mins",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Nunito Sans",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${widget.title}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                fontFamily: "Nunito Sans"),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
