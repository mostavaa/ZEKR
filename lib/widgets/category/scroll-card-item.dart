import 'package:flutter/material.dart';

class ScrollCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String desc;
  const ScrollCardItem({Key key, this.title, this.subtitle, this.desc})
      : super(key: key);

  @override
  _ScrollCardItemState createState() => _ScrollCardItemState();
}

class _ScrollCardItemState extends State<ScrollCardItem> {
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
        ],
      ),
    );
  }
}
