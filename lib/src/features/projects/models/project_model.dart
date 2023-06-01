import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String name;
  final List<String> imageUrl;
  final String description;
  final String url;
  final List<String> tags;

  const ProjectModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.url,
    required this.tags,
  });

  @override
  List<Object> get props => [
        name,
        imageUrl,
        description,
        url,
        tags,
      ];
}
