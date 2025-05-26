class ServiceModel {
  final String title;
  final String description;
  final String icon;
  final String backgroundImage;

  ServiceModel(
      {required this.title,
      required this.description,
      required this.icon,
      required this.backgroundImage});

  factory ServiceModel.fromFirestore(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      backgroundImage: data['background'] ?? '',
    );
  }
}
