import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/article_bloc/article_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/category_bloc/category_bloc.dart';
import 'package:travelv2/backend/comment_bloc/comment_bloc.dart';
import 'package:travelv2/backend/login_bloc/login_bloc.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/backend/writer_bloc/writer_bloc.dart';
import 'package:travelv2/backend/writer_bloc/writer_events.dart';
import 'package:travelv2/backend/article_bloc/article_repo.dart';
import 'package:travelv2/backend/category_bloc/category_repo.dart';
import 'package:travelv2/backend/comment_bloc/comment_repo.dart';
import 'package:travelv2/backend/writer_bloc/writer_repo.dart';
import 'package:travelv2/backend/article_bloc/article_states.dart';
import 'package:travelv2/backend/category_bloc/category_states.dart';
import 'package:travelv2/backend/comment_bloc/comment_states.dart';
import 'package:travelv2/backend/writer_bloc/writer_states.dart';
import 'package:travelv2/main.dart';
import 'package:travelv2/screens/login_page.dart';
import 'package:travelv2/screens/category_page.dart';
import 'package:travelv2/screens/comments_page.dart';
import 'package:travelv2/screens/home_page.dart';
import 'package:travelv2/screens/article_page.dart';
import 'package:travelv2/screens/signup_page.dart';
import 'package:travelv2/screens/splash_screen.dart';
import 'package:travelv2/screens/writer_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
        case '/':
        return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (_) => BlocProvider<LoginBloc>(
                  create: (_) => LoginBloc(LoginInitial(), UserRepository()),
                  child: splashScreen(),
                ));
      case '/login_page':
        return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (_) => BlocProvider<LoginBloc>(
                  create: (_) => LoginBloc(LoginInitial(), UserRepository()),
                  child: LoginPage(),
                ));
      case '/signup_page':
        return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (_) => BlocProvider<LoginBloc>(
                  create: (_) => LoginBloc(LoginInitial(), UserRepository()),
                  child: SignupPage(),
                ));

      //  return _errorRoute();
      case '/home':
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
      case '/category_page':
        if (args is Map) {
          return MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (_) => BlocProvider<CategoryBloc>(
                    create: (_) => CategoryBloc(
                        CategoryInitialState(), CategoryRepository()),
                    child: categoryPage(
                      categoryInfo: args,
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
