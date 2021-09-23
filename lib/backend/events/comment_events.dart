// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:travelv2/backend/model/comments_model.dart';

class CommentsEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchComment extends CommentsEvents {}

class FetchCommentsList extends CommentsEvents {}

class AddComment extends CommentsEvents {}
