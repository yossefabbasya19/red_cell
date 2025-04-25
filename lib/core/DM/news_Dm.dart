class NewsDm {
  String title;
  String imageUrl;
  String newsLink;

  NewsDm({required this.title, required this.imageUrl, required this.newsLink});

  factory NewsDm.fromJson(json){
    return NewsDm(
        title: json["title"],
        imageUrl: json["image_url"],
        newsLink: json["link"]);
  }
}