import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/bloc/article_bloc.dart';
import 'package:travelv2/backend/bloc/category_bloc.dart';
import 'package:travelv2/backend/bloc/comment_bloc.dart';
import 'package:travelv2/backend/bloc/writer_bloc.dart';
import 'package:travelv2/backend/events/writer_events.dart';
import 'package:travelv2/backend/repo/article_repo.dart';
import 'package:travelv2/backend/repo/category_repo.dart';
import 'package:travelv2/backend/repo/comment_repo.dart';
import 'package:travelv2/backend/repo/writer_repo.dart';
import 'package:travelv2/backend/states/article_states.dart';
import 'package:travelv2/backend/states/category_states.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/backend/states/writer_states.dart';
import 'package:travelv2/main.dart';
import 'package:travelv2/screens/comments.dart';
import 'package:travelv2/screens/home.dart';
import 'package:travelv2/screens/article_page.dart';
import 'package:travelv2/screens/writer_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ArticleBloc>(
                      create: (_) => ArticleBloc(
                          ArticleInitialState(), ArticleRepository()),
                    ),
                    BlocProvider<CategoryBloc>(
                      create: (_) => CategoryBloc(
                          CategoryInitialState(), CategoryRepository()),
                    ),
                  ],
                  child: Home(),
                ));
      case '/article_page':
        if (args is Map) {
          return MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (_) => BlocProvider<WriterBlocc>(
                    create: (_) =>
                        WriterBlocc(InitialState(), WriterRepository()),
                    child: articlePage(
                      datax: args,
                    ),
                  ));
        }
        return _errorRoute();
      case '/comments':
        if (args is Map) {
          return MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider<CommentsBloc>(
                          create: (_) => CommentsBloc(
                              CommentsInitialState(), CommentsRepository()),
                        ),
                      ],
                      child: commentsPage(
                        data: args,
                      )));
        }
        return _errorRoute();
      case '/writer_page':
        if (args is Map) {
          return MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider<WriterBlocc>(
                        create: (_) =>
                            WriterBlocc(InitialState(), WriterRepository()),
                      ),
                      BlocProvider<ArticleBloc>(
                        create: (_) => ArticleBloc(
                            ArticleInitialState(), ArticleRepository()),
                      ),
                    ],
                    child: writerPage(
                      writerInfo: args,
                    ),
                  ));
        }
        return _errorRoute();
      default:
        return _errorRouteExplain();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}

Route<dynamic> _errorRouteExplain() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error not found route"),
      ),
      body: Center(
        child: Text('Error not found route'),
      ),
    );
  });
}
