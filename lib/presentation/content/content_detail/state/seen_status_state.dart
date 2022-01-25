import 'package:domain/model/seen_status.dart';

abstract class SeenStatusState {}

class StatusSuccess extends SeenStatusState {
  StatusSuccess({
    required this.status,
  });

  final SeenStatus status;
}

class StatusLoading extends SeenStatusState {}

class StatusError extends SeenStatusState {}
