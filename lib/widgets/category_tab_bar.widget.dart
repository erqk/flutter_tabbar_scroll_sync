import 'package:flutter/material.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  final TabController controller;
  final List<dynamic> data;

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) => TabBar(
          controller: widget.controller,
          isScrollable: true,
          labelPadding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          indicatorWeight: 6,
          tabs: List.generate(widget.data.length, (index) {
            var item = widget.data[index];

            return SizedBox(
              // Explicit set the height to take full height of the tab bar
              height: constraints.maxHeight,
              child: Text(
                '${item['label']}',
                style: TextStyle(color: Colors.black),
              ),
            );
          }),
        ),
      ),
    );
  }
}
