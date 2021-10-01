// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/writer_bloc/writer_repo.dart';
import 'package:travelv2/backend/writer_bloc/writer_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/backend/writer_bloc/writer_bloc.dart';
import 'package:travelv2/backend/model/writer_model.dart';

class date_writer extends StatefulWidget {
  date_writer({Key? key, required this.data}) : super(key: key);
  final Map data;
  @override
  State<date_writer> createState() => _date_writerState();
}

class _date_writerState extends State<date_writer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: size.height * 0.01),
        height: size.height * 0.10,
        width: size.width,
        child: Row(
          children: [
            BlocBuilder<WriterBlocc, WriterStates>(
                // stream: newsBloc.articleStream,
                builder: (context, state) {
              if (state is LoadingState) {
                CircularProgressIndicator();
              } else if (state is FetchSuccess) {
                var writerdata = state.writer;
                return InkWell(
                  child: WriterCard(
                      image: writerdata!.writerImage,
                      name: writerdata.writerName,
                      date: widget.data['date'],
                      press: () {}),
                  onTap: () {
                    Navigator.of(context).pushNamed('/writer_page', arguments: {
                      'id': writerdata.writerID,
                      'writerName': writerdata.writerName,
                      'totalArticles': writerdata.totalArticles,
                      'writerBio': writerdata.writerBio,
                      'writerImage': writerdata.writerImage,
                    });
                  },
                );
              } else if (state is ErrorState) {
                Text("ERROR DATA");
              }
              return const Center(
                  child: Text(
                "No data",
                style: TextStyle(fontSize: 30),
              ));
            })
          ],
        ),
      ),
      onTap: () =>
          {Navigator.of(context).pushNamed('/writer_page', arguments: "")},
    );
  }
}

class WriterCard extends StatefulWidget {
  const WriterCard({
    Key? key,
    this.image,
    required this.date,
    required this.name,
    required this.press,
  }) : super(key: key);

  final String? image;
  final String name, date;
  final Function press;

  @override
  _WriterCardState createState() => _WriterCardState();
}

class _WriterCardState extends State<WriterCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: PlaceHolder,
              image: widget.image.toString(),
              height: size.height * 0.08,
              width: size.width * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
            child: Container(
              height: size.height,
              width: size.width * 0.004,
              color: Colors.black,
            ),
          ),
          Container(
            width: size.width * 0.5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontFamily: "SF",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(widget.name,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                          fontFamily: "SF",
                          fontSize: 17))
                ]),
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              iconSize: 26,
              color: kPrimaryColor,
              onPressed: () {},
              icon: Icon(EvaIcons.paperPlane)),
          SizedBox(
            width: size.width * 0.001,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              iconSize: 26,
              color: kPrimaryColor,
              onPressed: () {},
              icon: Icon(EvaIcons.bookmarkOutline)),
        ]);
  }
}
