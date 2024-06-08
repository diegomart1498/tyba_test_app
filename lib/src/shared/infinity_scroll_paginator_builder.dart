part of 'package.dart';

class InfinityScrollPaginatorBuilder<T> extends StatefulWidget {
  InfinityScrollPaginatorBuilder({
    required this.futurePaginated,
    required this.itemBuilder,
    required this.loadingBuilder,
    this.size = 10,
    super.key,
  }) : assert(
          T.runtimeType != List,
          'The future must to return a List type object',
        );

  final Future<T> Function(int page) futurePaginated;
  final Widget Function(BuildContext context, int index) loadingBuilder;
  final Widget Function(BuildContext context, int index, List items)
      itemBuilder;
  final int size;

  @override
  State<InfinityScrollPaginatorBuilder> createState() =>
      _PaginatorBuilderState();
}

class _PaginatorBuilderState<T> extends State<InfinityScrollPaginatorBuilder> {
  int page = 1;
  Timer? _debouncer;
  List<dynamic> items = [];
  bool canFetchData = true;
  bool isLoadingItems = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFirstPageInfo();
      _scrollControllerListener();
    });
  }

  Future<void> _fetchFirstPageInfo() async {
    _setLoading(true);
    final List<dynamic> firstPageInfo = await widget.futurePaginated(page);
    _addItems(firstPageInfo);
    _setLoading(false);
  }

  void _addItems(List<dynamic> newItems) {
    if (mounted) setState(() => items = [...items, ...newItems]);
  }

  void _setLoading(bool value) {
    if (mounted) setState(() => isLoadingItems = value);
  }

  void _incrementPage() {
    if (mounted) setState(() => page++);
  }

  void _stopFetchingData() {
    if (mounted) setState(() => canFetchData = false);
  }

  Future<void> _fetchNextPageInfo() async {
    _setLoading(true);
    final List<T> nextPageInfo = await widget.futurePaginated(page);
    if (nextPageInfo.length < widget.size) _stopFetchingData();
    _addItems(nextPageInfo);
    _setLoading(false);
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      if (!canFetchData) return;
      if (_scrollController.position.outOfRange) return;

      final double offset = _scrollController.offset;
      final double maxOffset = _scrollController.position.maxScrollExtent;

      if (mounted && offset + 600 >= maxOffset) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_debouncer?.isActive ?? false) _debouncer?.cancel();
          _debouncer = Timer(const Duration(milliseconds: 200), () {
            _incrementPage();
            _fetchNextPageInfo();
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: padding16,
      itemCount: items.isEmpty ? 10 : items.length,
      controller: _scrollController,
      itemBuilder: _itemBuilderWithLoading(),
    );
  }

  Widget? Function(BuildContext, int) _itemBuilderWithLoading() {
    if (items.isEmpty) return widget.loadingBuilder;

    return (context, index) {
      if (index != items.length - 1) {
        return widget.itemBuilder(context, index, items);
      }

      return Column(
        children: [
          widget.itemBuilder(context, index, items),
          if (isLoadingItems) widget.loadingBuilder(context, index),
          const EndPageDivider(),
        ],
      );
    };
  }
}
