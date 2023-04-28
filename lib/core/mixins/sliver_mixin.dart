import 'package:flutter/material.dart';

mixin SliverMixin<T extends StatefulWidget> on State<T> {
  late ScrollController scrollController;
  bool isTitleVisible = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(listenScrollController);
    super.initState();
  }

  void listenScrollController() {
    var initialState = isTitleVisible;
    if (scrollController.offset + kToolbarHeight > 260) {
      isTitleVisible = true;
    } else {
      isTitleVisible = false;
    }
    if(initialState != isTitleVisible) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
