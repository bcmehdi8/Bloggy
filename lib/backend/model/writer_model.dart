class Writer {
  final int writerID;
  final String writerName;
  final int totalArticles;
  final String? writerBio;
  final String? writerImage;

  Writer({
    required this.writerID,
    required this.writerName,
    required this.totalArticles,
    this.writerBio,
    this.writerImage,
  });

  factory Writer.fromJson(Map<String, dynamic> json) {
    return Writer(
      writerID: json['writerID'],
      writerName: json['writerName'],
      totalArticles: json['totalArticles'],
      writerBio: json['writerBio'],
      writerImage: json['writerImage'],
    );
  }
  Map<String, dynamic> toJson() => {
        "writerID": writerID,
        "writerName": writerName,
        "totalArticles": totalArticles,
        "writerBio": writerBio,
        "writerImage": writerImage,
      };

}
