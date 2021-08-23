import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zekr/models/category-item.dart';
import 'package:zekr/widgets/category/card-item.dart';
import 'package:zekr/widgets/home/home-content.dart';
import '../widgets/bg.dart';

class CategoryScreen extends StatefulWidget {
  static final String routeName = 'CategoryScreen';

  const CategoryScreen({Key key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int initialCounter = 0;
  int currentIndex = 0;
  ZekrCategoryItem catitem;
  void decrementCounter() {
    setState(() {
      if (initialCounter == 0) {
        if (currentIndex > 0) {
          currentIndex--;
          initialCounter = 0;
        }
      } else
        initialCounter--;
    });
  }

  void incrementCounter() {
    setState(() {
      if (initialCounter == catitem.Content[currentIndex].Count) {
        if (currentIndex < catitem.Content.length - 1) {
          currentIndex++;
          initialCounter = 0;
        }
      } else
        initialCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    catitem = ModalRoute.of(context).settings.arguments as ZekrCategoryItem;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final myAppBar = AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(catitem.Title),
    );

    Widget previous = Container();
    if (currentIndex > 0)
      previous = FlatButton(
        onPressed: () {
          decrementCounter();
        },
        child: Text("السابق"),
      );

    Widget next = Container();
    if (currentIndex < catitem.Content.length - 1)
      next = FlatButton(
        onPressed: () {
          incrementCounter();
        },
        child: Text(initialCounter == catitem.Content[currentIndex].Count
            ? "التالي"
            : initialCounter.toString()),
      );
    return Scaffold(
      key: _scaffoldKey,
      appBar: myAppBar,
      body: Stack(
        children: [
          //BG(color: Colors.white),
          SingleChildScrollView(
            child: Builder(
              builder: (ctx) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        constraints: BoxConstraints(minHeight: 140),
                        child: CardItem(
                            title: catitem.Content[currentIndex].Zekr,
                            desc: catitem.Content[currentIndex].Source,
                            progress: initialCounter,
                            total: catitem.Content[currentIndex].Count,
                            subtitle:
                                "عدد المرات ${catitem.Content[currentIndex].Count}"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              next,
              SizedBox(
                height: 10,
              ),
              previous
            ],
          )
        ],
      ),
    );
  }
}
