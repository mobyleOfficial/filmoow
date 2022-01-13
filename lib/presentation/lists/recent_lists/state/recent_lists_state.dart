import 'package:domain/model/content_list.dart';

abstract class RecentListsState {}

class Loading extends RecentListsState {}

class Success extends RecentListsState {
  Success({
    required this.lists,
  });

  final List<ContentList> lists;
}

class Error extends RecentListsState {}
