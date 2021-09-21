// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/repo/writer_repo.dart';
import 'package:travelv2/backend/states/writer_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/backend/bloc/writer_bloc.dart';
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
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.1),
        height: size.height * 0.12,
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
    return Row(children: [
      ClipOval(
        child: Image.network(
          widget.image.toString(),
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: size.height,
          width: 3,
          color: Colors.black,
        ),
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              widget.date,
              style: TextStyle(
                fontFamily: "Lato",
              ),
            ),
            Text(widget.name,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: "Lato",
                    fontSize: 20))
          ])
    ]);
  }
}
