import 'package:flutter/material.dart';

class ScrollProvider with ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  ScrollProvider() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Reached end of list — trigger loading more data, for example
      print("Reached end of list");
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
