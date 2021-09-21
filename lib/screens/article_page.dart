// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/bloc/article_bloc.dart';
import 'package:travelv2/backend/bloc/writer_bloc.dart';
import 'package:travelv2/backend/events/article_events.dart';
import 'package:travelv2/backend/events/writer_events.dart';
import 'package:travelv2/config/constants.dart';
import 'components/Article/article_title_description.dart';
import 'components/Article/date_writer_card.dart';

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
          leading: BackButton(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: kPrimaryColor,
                ),
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
              date_writer(data: widget.datax),
              ArticleTitleDescription(data: widget.datax),
            ],
          ),
        ));
  }
}
