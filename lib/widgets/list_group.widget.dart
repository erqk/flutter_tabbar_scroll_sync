import 'package:flutter/material.dart';
import 'package:flutter_tabbar_scroll_sync/widgets/list_item.widget.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({Key? key, required this.label, required this.data})
      : super(key: key);

  final String label;
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(data.length, (index) {
        return ListItem(id: '${index + 1}');
      }),
    );
  }
}
