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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(fontWeightDelta: 2),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == data.length - 1 ? 20 : 0,
              ),
              child: ListItem(id: '${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: data.length,
        )
      ],
    );
  }
}
