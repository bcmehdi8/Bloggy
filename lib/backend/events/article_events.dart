import 'package:equatable/equatable.dart';

class ArticleEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchArticle extends ArticleEvents {}
class FetchArticleList extends ArticleEvents {}
class FetchPopularWriterArticles extends ArticleEvents {}
