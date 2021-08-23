import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String desc;
  final int progress;
  final int total;
  const CardItem(
      {Key key,
      this.title,
      this.subtitle,
      this.desc,
      this.progress,
      this.total})
      : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.desc,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              value: widget.progress / widget.total,
            ),
          ),
        ],
      ),
    );
  }
}
