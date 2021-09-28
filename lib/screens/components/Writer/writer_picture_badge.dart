// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/writer_bloc/writer_bloc.dart';
import 'package:travelv2/backend/writer_bloc/writer_states.dart';
import 'package:travelv2/config/constants.dart';

class writerPictureBadge extends StatefulWidget {
  final Map writerInfo;
  const writerPictureBadge({Key? key, required this.writerInfo})
      : super(key: key);

  @override
  State<writerPictureBadge> createState() => _writerPictureBageState();
}

class _writerPictureBageState extends State<writerPictureBadge> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.5),
      child: Column(
        children: [
          Container(
            width: 78,
            height: 78,
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              backgroundImage: NetworkImage(widget.writerInfo['writerImage']),
              child: Text(
                "",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: BlocBuilder<WriterBlocc, WriterStates>(
              builder: (context, state) {
                if (state is InitialState) {
                  return CircularProgressIndicator();
                } else if (state is LoadingState) {
                  return CircularProgressIndicator();
                } else if (state is FetchSuccess) {
                  return Text(
                    state.writer!.writerName,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        fontFamily: "NunitoSans"),
                  );
                } else if (state is ErrorState) {
                  return ErrorWidget(state.message.toString());
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top Author",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      fontFamily: "NunitoSans"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.network(
                    "https://miro.medium.com/max/512/1*nZ9VwHTLxAfNCuCjYAkajg.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
