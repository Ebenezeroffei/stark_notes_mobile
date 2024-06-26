import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
