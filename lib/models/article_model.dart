class ArticleModel {
  final int id;
  final String title;
  final String imageUrl;
  final String newsSite;
  final String summary;

  ArticleModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
  });

  factory ArticleModel.fromJson(
      Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      newsSite: json['news_site'] ?? '',
      summary: json['summary'] ?? '',
    );
  }
}