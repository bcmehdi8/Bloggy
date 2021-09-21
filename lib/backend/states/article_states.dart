import 'package:equatable/equatable.dart';
import 'package:travelv2/backend/model/article_model.dart';

class ArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class FetchSuccess extends ArticleState {
  Article? article;
  FetchSuccess({this.article});
}

class FetchSuccessList extends ArticleState {
  List<Article> article;
  FetchSuccessList({required this.article});
}

class ErrorState extends ArticleState {
  String message;
  ErrorState({required this.message});
}
