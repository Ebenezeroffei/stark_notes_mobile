import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.dateModified,
    required this.dateCreated,
    required this.isArchived,
    required this.isPinned,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, title];
}
