import 'package:flutter/material.dart';

class Comments {
  final int commentId;
  final int id;
    final String? commenterImage;
  final String commenterName;
  final String comment;
  final String commentDate;
  final int commentLike;
  final int commentReplies;

  Comments({
    required this.commentId,
    required this.id,
    this.commenterImage,
    required this.commenterName,
    required this.comment,
    required this.commentDate,
    required this.commentLike,
    required this.commentReplies,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      commentId: json['commentID'],
      id: json['articleID'],
      commenterImage: json['userImage'],
      commenterName: json['userName'],
      comment: json['commentContent'],
      commentDate: json['commentDate'],
      commentLike: json['commentLikes'],
      commentReplies: json['commentReplies'],
    );
  }
  Map<String, dynamic> toJson() => {
        "commentID": commentId,
        "articleID": id,
        "userImage": commenterImage,
        "userName": commenterName,
        "commentContent": comment,
        "commentDate": commentDate,
        "commentLikes": commentLike,
        "commentReplies": commentReplies,
      };
}
