import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime dateModified;

  @HiveField(4)
  final DateTime dateCreated;

  @HiveField(5)
  final bool isArchived;

  @HiveField(6)
  final bool isPinned;

  // TODO: Add color and background fields

  Note({
    String? id,
    required this.title,
    required this.content,
    DateTime? dateModified,
    DateTime? dateCreated,
    bool? isArchived,
    bool? isPinned,
  })  : id = id ?? Uuid().v4(),
        dateModified = dateModified ?? DateTime.now(),
        dateCreated = dateCreated ?? DateTime.now(),
        isArchived = isArchived ?? false,
        isPinned = isPinned ?? false;

  Note update({
    required String title,
    required String content,
  }) =>
      Note(
        id: id,
        title: title,
        content: content,
        dateCreated: dateCreated,
        dateModified: DateTime.now(),
      );

  @override
  String toString() {
    return 'Note<$title,$content>';
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, title];
}
