import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/bloc/category_bloc.dart';
import 'package:travelv2/backend/states/category_states.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: BlocBuilder<CategoryBloc, CategoryState>(
              // stream: newsBloc.articleStream,
              builder: (context, state) {
            if (state is CategoryLoadingState) {
              CircularProgressIndicator();
            } else if (state is CategoryFetchSuccessList) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.category.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = state.category[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Container(
                        width: 58,
                        height: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(data.categoryImage),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(data.categoryName),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is CategoryErrorState) {
              Text("ERROR DATA");
            }
            return const Center(
                child: Text(
              "No data",
              style: TextStyle(fontSize: 30),
            ));
          })),
        ],
      ),
    );
  }
}
