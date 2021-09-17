import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class categoriesHolder extends StatefulWidget {
  const categoriesHolder({Key? key}) : super(key: key);

  @override
  _categoriesHolderState createState() => _categoriesHolderState();
}

class _categoriesHolderState extends State<categoriesHolder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //  color: Colors.cyan,
      height: size.height * 0.14,
      child: Row(
        children: [
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 50,
                        height: 40,
                        child: Column(
                          children: [
                            Image.network(
                                "https://cdn-icons-png.flaticon.com/512/77/77305.png"),
                            Text("Movies")
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
