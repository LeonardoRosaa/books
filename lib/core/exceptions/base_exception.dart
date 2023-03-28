import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  const AppException([this.error]);

  final Object? error;

  @override
  List<Object?> get props => [error];
}