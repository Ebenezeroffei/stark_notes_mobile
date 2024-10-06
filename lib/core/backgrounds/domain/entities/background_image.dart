import 'package:equatable/equatable.dart';

class BackgroundImage extends Equatable {
  final String light;
  final String dark;

  const BackgroundImage({required this.light, required this.dark});

  @override
  List<Object?> get props => [light, dark];
}
