enum ListGetType { isFromStart, isFromSearch, isFromRefresh, isFromPagination }

enum LoadingStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
  maxReached,
}

// enum LoadingType {
//   isLoading(false),
//   isLoadingMore(false);

//   final bool value;
//   const LoadingType(this.value);
// }
