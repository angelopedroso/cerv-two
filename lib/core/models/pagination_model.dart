class PaginationModel<T> {
  final List<T> items;
  final int pageSize;
  final int page;

  PaginationModel({
    required this.items,
    required this.pageSize,
    required this.page,
  });
}
