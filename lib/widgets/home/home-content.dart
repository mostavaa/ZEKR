import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zekr/models/category-item.dart';
import 'package:zekr/models/category.dart';
import 'package:zekr/providers/favourite.dart';
import 'package:zekr/screens/category-screen.dart';
import 'package:zekr/screens/scroll-category-screen.dart';
import 'package:zekr/util/file.dart';
import 'package:zekr/widgets/home/home-list-item.dart';
import 'package:flutter_share/flutter_share.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<ZekrCategory> menulist = new List<ZekrCategory>();
  Favourite _favService = new Favourite();
  @override
  void initState() {
    readData(filename: "Menu");
    super.initState();
  }

  readData({filename = "Menu"}) async {
    await _favService.getFavourites();
    await FileHandler.readJson(context, filename: filename).then((res) {
      setState(() {
        menulist =
            res.map<ZekrCategory>((e) => ZekrCategory.fromJson(e)).toList();
        menulist.forEach((item) =>
            item.isFavourite = _favService.isFavourite(item.Id.toString()));
        //menulist = res;
      });
    });
  }

  onTabMenuItemHandler(context, ZekrCategory menuItem) async {
    final response = await FileHandler.readJson(context, filename: menuItem.Id);
    final catItem = ZekrCategoryItem.fromJson(response);
    //SocialShare.copyToClipboard("This is Social Share plugin");
    //SocialShare.shareWhatsapp("hi");
    //FlutterShare.share(title: "hi there");
    if (!catItem.Scrollable)
      Navigator.of(context)
          .pushNamed(CategoryScreen.routeName, arguments: catItem);
    else
      Navigator.of(context)
          .pushNamed(ScrollCategoryScreen.routeName, arguments: catItem);
  }

  void markAsFavourite(String id) {
    setState(() {
      int idInt = int.parse(id);
      menulist.firstWhere((o) => o.Id == idInt).isFavourite = true;
    });
  }

  void removeFromFavourites(String id) {
    setState(() {
      int idInt = int.parse(id);
      menulist.firstWhere((o) => o.Id == idInt).isFavourite = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 500,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: menulist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                  child: HomeListItem(
                id: menulist[index].Id,
                markAsFavourite: (id) => markAsFavourite(id),
                removeFromFavourites: (id) => removeFromFavourites(id),
                title: menulist[index].Title,
                onTabMenuItemHandler: () =>
                    onTabMenuItemHandler(context, menulist[index]),
                isFavourite: menulist[index].isFavourite,
              )),
            );
          },
        ),
      ),
    );
  }
}
