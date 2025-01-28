class ReelModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String description;

  ReelModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.description,
  });

  // Factory method to convert JSON to a ReelModel object
  factory ReelModel.fromJson(Map<String, dynamic> json) {
    return ReelModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
