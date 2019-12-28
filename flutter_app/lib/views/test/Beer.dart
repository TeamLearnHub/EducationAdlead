class Beer {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;

  Beer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        tagline = json['tagline'],
        description = json['description'],
        image_url = json['image_url'];
}
