// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:travelv2/backend/model/comments_model.dart';

class CommentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommentsInitialState extends CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsFetchSuccess extends CommentsState {
  Comments? comments;
  CommentsFetchSuccess({this.comments});
}

class CommentsFetchSuccessList extends CommentsState {
  List<Comments> comments;
  CommentsFetchSuccessList({required this.comments});
}

class CommentsErrorState extends CommentsState {
  String message;
  CommentsErrorState({required this.message});
}
class CommentAddedState extends CommentsState {}
