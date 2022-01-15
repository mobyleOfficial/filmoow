import 'package:domain/model/user.dart';

class UserListing {
  const UserListing({
    required this.hasNext,
    required this.userList,
  });

  final bool hasNext;

  final List<User> userList;
}
