import 'package:lettutor/src/models/course/course_category.dart';

class Book {
  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late String level;
  late bool visible;
  late String fileUrl;
  late String createdAt;
  late String updatedAt;
  bool? isPrivate;
  String? createdBy;
  List<CourseCategory>? categories;

  Book({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.visible,
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
    this.isPrivate,
    this.createdBy,
    this.categories,
  });

}