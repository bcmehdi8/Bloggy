class UserModel {
  final int userid;
  final String username;
  final String? userimg;
  final String useremail;

  UserModel({
    required this.userid,
    required this.username,
    this.userimg,
    required this.useremail,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userid: json['userID'],
      username: json['userName'],
      userimg: json['userImage'],
      useremail: json['userEmail'],
    );
  }
  Map<String, dynamic> toJson() => {
        "userID": userid,
        "userName": username,
        "userImage": userimg,
        "userEmail": useremail,
      };
}
