import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'label.g.dart';

@HiveType(typeId: 2)
class Label extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  Label({required this.name, String? id}) : id = id ?? const Uuid().v4();

  factory Label.copy({
    required String name,
    required String id,
  }) =>
      Label(name: name, id: id);

  @override
  List<Object?> get props => [name, id];
}
