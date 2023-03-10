import 'tag.dart';

class Note {
  final String title;
  final String resume;
  final DateTime createdAt;
  final List<Tag> tags;
  final String color;
  final String group;

  Note({
    required this.title,
    required this.resume,
    required this.createdAt,
    required this.tags,
    required this.color,
    required this.group,
  });
}
