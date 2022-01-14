import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PaginationBloc<T, Error> with SubscriptionHolder {
  // Stream
  @protected
  final onNextStateSubject =
      BehaviorSubject<PaginationListingState<T, Error>>.seeded(
    PaginationListingState<T, Error>(),
  );
  @protected
  final onNexPageRequestSubject = PublishSubject<int>();

  Stream<PaginationListingState<T, Error>> get onNextState =>
      onNextStateSubject.stream;

  @protected
  int page = 1;

  void requestNextPage(int offset) {
    onNexPageRequestSubject.add(offset);
  }

  void dispose() {
    onNextStateSubject.close();
    onNexPageRequestSubject.close();
  }
}
