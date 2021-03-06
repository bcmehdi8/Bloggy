// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/article_bloc/article_bloc.dart';
import 'package:travelv2/backend/writer_bloc/writer_bloc.dart';
import 'package:travelv2/backend/article_bloc/article_events.dart';
import 'package:travelv2/backend/writer_bloc/writer_events.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/comments_page.dart';
import 'components/Article/article_title_description.dart';
import 'components/Article/date_writer_card.dart';
import 'package:like_button/like_button.dart';

class articlePage extends StatefulWidget {
  final Map datax;

  articlePage({Key? key, required this.datax}) : super(key: key);

  @override
  _articlePageState createState() => _articlePageState();
}

// ignore: camel_case_types
class _articlePageState extends State<articlePage> {
  late WriterBlocc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<WriterBlocc>(context);
    bloc.add(getWriterCard());
    bloc.writerIdController = widget.datax['writerID'];
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: new IconButton(
          icon: new Icon(
            EvaIcons.arrowIosBack,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz_outlined),
              padding: EdgeInsets.only(right: 1),
              //iconSize: 28.0,

              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  date_writer(data: widget.datax),
            ArticleTitleDescription(data: widget.datax),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "17",
            style: TextStyle(
              fontFamily: "SF",
              fontWeight: FontWeight.w800,
            ),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          icon: Icon(
            LineIcons.commentDots,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/comments', arguments: {
              'articleID': widget.datax['articleID'],
              'image': widget.datax['image'],
              'title': widget.datax['title'],
              'Description': widget.datax['Description'],
              'readTime': widget.datax['readTime'],
              'date': widget.datax['date'],
              'writerID': widget.datax['writerID'],
            });
          }),
      //  floatingActionButton: CustomFABWidget(data: widget.datax,),
      // floatingActionButton: OpenContainer(
      //   openBuilder: (context, _) => commentsPage(),
      //   closedBuilder: (context, _) {},
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.black,
      //     foregroundColor: Colors.black,
      //     onPressed: () {
      //       // Respond to button press
      //     },
      //     // label: Text(
      //     //   'Comments',
      //     //   style: TextStyle(color: Colors.white),
      //     // ),
      //     child: Icon(
      //       LineIcons.commentDots,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
