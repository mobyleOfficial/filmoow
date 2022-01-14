class PaginationState {}

class PaginationListingState<T, Error> implements PaginationState {
  const PaginationListingState({
    this.list,
    this.nextOffset,
    this.error,
  });

  final List<T>? list;
  final int? nextOffset;
  final Error? error;
}

class PaginationListingError implements PaginationState {}

class PaginationLoading extends PaginationState {}