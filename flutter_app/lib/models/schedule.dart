class Movie{
  final String title;
  final String avatar;
  final String file_mp4;
  final String date_created;

  Movie({this.title, this.avatar, this.file_mp4, this.date_created});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['title'],
      avatar: json['avatar'],
      file_mp4: json['file_mp4'],
      date_created: json['date_created'],
    );
  }
}