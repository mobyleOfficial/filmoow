import 'package:domain/model/content_list.dart';

abstract class AllListsState {}

class Loading extends AllListsState {}

class Success extends AllListsState {
  Success({
    required this.lists,
  });

  final List<ContentList> lists;
}

class Error extends AllListsState {}
