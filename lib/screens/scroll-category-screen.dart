import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zekr/models/category-item.dart';
import 'package:zekr/widgets/category/card-item.dart';
import 'package:zekr/widgets/category/scroll-card-item.dart';
import 'package:zekr/widgets/home/home-content.dart';
import '../widgets/bg.dart';

class ScrollCategoryScreen extends StatefulWidget {
  static final String routeName = 'ScrollCategoryScreen';

  const ScrollCategoryScreen({Key key}) : super(key: key);

  @override
  _ScrollCategoryScreenState createState() => _ScrollCategoryScreenState();
}

class _ScrollCategoryScreenState extends State<ScrollCategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ZekrCategoryItem catitem;
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    setState(() {
      catitem = ModalRoute.of(context).settings.arguments as ZekrCategoryItem;
    });

    final myAppBar = AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(catitem.Title),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: myAppBar,
      body: Stack(
        children: [
          //BG(color: Colors.white),
          Builder(
            builder: (ctx) {
              return Center(
                child: ListView.builder(
                  itemCount: catitem.Content.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 300,
                      constraints: BoxConstraints(minHeight: 140),
                      child: ScrollCardItem(
                        title: catitem.Content[index].Zekr,
                        desc: catitem.Content[index].Source,
                        subtitle: "عدد المرات ${catitem.Content[index].Count}",
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
