import 'package:flutter/material.dart';
import 'package:flutter_tabbar_scroll_sync/widgets/category_tab_bar.widget.dart';
import 'dart:math' as math;

import 'package:flutter_tabbar_scroll_sync/widgets/list_group.widget.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with TickerProviderStateMixin {
  late TabController _categoryTabController;
  final List<dynamic> _dataList = [];
  final List<dynamic> _tabInfoList = [];

  void _getData() {
    for (int i = 0; i < 10; i++) {
      _dataList.add({
        'category': 'Category ${i + 1}',
        'items': List.generate(math.Random().nextInt(20) + 5, (index) => null),
      });
    }
  }

  void _initTabList() {
    for (int i = 0; i < _dataList.length; i++) {
      _tabInfoList.add({
        'key': GlobalKey(),
        'label': _dataList[i]['category'],
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _initTabList();
    _categoryTabController =
        TabController(length: _tabInfoList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget contentList() {
      return SingleChildScrollView(
        child: Column(
          children: List.generate(_dataList.length, (index) {
            var item = _dataList[index];

            return ListGroup(
              label: item['category'],
              data: item['items'],
            );
          }),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _CategoryTabBarDelegate(
                controller: _categoryTabController,
                data: _tabInfoList,
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: contentList(),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryTabBarDelegate extends SliverPersistentHeaderDelegate {
  _CategoryTabBarDelegate({
    required this.controller,
    required this.data,
  });

  final TabController controller;
  final List<dynamic> data;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent,) {
    return SizedBox.expand(
      child: CategoryTabBar(controller: controller, data: data),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}