import 'package:domain/model/watched_time.dart';

class UserInformation {
  const UserInformation({
    required this.name,
    required this.userName,
    required this.imageUrl,
    required this.watchedTime,
    required this.seenNumber,
    required this.commentNumber,
    required this.listNumber,
  });

  final String name;

  final String userName;

  final String imageUrl;

  final WatchedTime watchedTime;

  final int seenNumber;

  final int commentNumber;

  final int listNumber;
}