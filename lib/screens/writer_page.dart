// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables, unnecessary_new

import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/bloc/article_bloc.dart';
import 'package:travelv2/backend/bloc/writer_bloc.dart';
import 'package:travelv2/backend/events/article_events.dart';
import 'package:travelv2/backend/events/writer_events.dart';
import 'package:travelv2/backend/model/writer_model.dart';
import 'package:travelv2/backend/repo/writer_repo.dart';
import 'package:travelv2/backend/states/writer_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/components/Home/title_no_btn.dart';
import 'package:travelv2/screens/components/Writer/writer_picture_badge.dart';

import 'components/Home/title_more_btn.dart';
import 'components/Writer/writer_posts_carousel.dart';

class writerPage extends StatefulWidget {
  final Map writerInfo;
  writerPage({Key? key, required this.writerInfo}) : super(key: key);

  @override
  State<writerPage> createState() => _writerPageState();
}

class _writerPageState extends State<writerPage> {
  late WriterBlocc bloc;
  late ArticleBloc articlebloc;

  @override
  void initState() {
    // bloc.writerIdController = 1;
    bloc = BlocProvider.of<WriterBlocc>(context);
    articlebloc = BlocProvider.of<ArticleBloc>(context);
    articlebloc.writerID = widget.writerInfo['id'];
    bloc.writerIdController = widget.writerInfo['id'];
    bloc.add(getWriterCard());
    articlebloc.add(FetchPopularWriterArticles());
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            writerPictureBadge(writerInfo: widget.writerInfo),
            TitleWithNoBtn(title: "Popular Posts", press: () {}),
            writerbody(),
          ],
        ),
      ),
    );
  }
}
