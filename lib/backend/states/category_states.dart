// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/backend/model/category_model.dart';


class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryFetchSuccess extends CategoryState {
  Category? article;
  CategoryFetchSuccess({this.article});
}

class CategoryFetchSuccessList extends CategoryState {
  List<Category> category;
  CategoryFetchSuccessList({required this.category});
}
class CategoryPostsFetchSuccess extends CategoryState {
  List<Article> article;
  CategoryPostsFetchSuccess({required this.article});
}

class CategoryErrorState extends CategoryState {
  String message;
  CategoryErrorState({required this.message});
}
