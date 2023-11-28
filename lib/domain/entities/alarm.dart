// Package imports:
import 'package:equatable/equatable.dart';

class Alarm extends Equatable {
  const Alarm({
    required this.id,
    required this.volume,
    required this.isEnabled,
  });

  final int id;
  final double volume;
  final bool isEnabled;

  @override
  List<Object?> get props => [id];
}
