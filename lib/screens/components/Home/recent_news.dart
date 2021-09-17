// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/repos/article_bloc.dart';
import 'package:travelv2/repos/article_model.dart';
import 'package:travelv2/screens/home.dart';

class recentNews extends StatefulWidget {
  const recentNews({Key? key}) : super(key: key);

  @override
  State<recentNews> createState() => _recentNewsState();
}

class _recentNewsState extends State<recentNews> {
  final newsBloc = NewsBloc();

  @override
  void initState() {
    newsBloc.eventSink.add(ArticleAction.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Article>>(
                stream: newsBloc.articleStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    // ignore: curly_braces_in_flow_control_structures
                    return Center(
                      child: Text("Error"),
                    );
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var article = snapshot.data![index];
                          return Align(
                            heightFactor: 1.2,
                            child: InkWell(
                              child: recentNewsCard(
                                  image: article.image,
                                  title: article.title,
                                  date: article.date,
                                  readTime: article.readTime,
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  }),
                              onTap: () => {
                                Navigator.of(context).pushNamed('/article_page',
                                    arguments: "hello world")
                              },
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
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

class recentNewsCard extends StatefulWidget {
  const recentNewsCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.readTime,
      required this.press})
      : super(key: key);

  final String image, title, date;
  final int readTime;
  final Function press;

  @override
  _recentNewsCardState createState() => _recentNewsCardState();
}

class _recentNewsCardState extends State<recentNewsCard> {
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
