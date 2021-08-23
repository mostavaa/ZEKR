import 'package:flutter/material.dart';
import 'package:zekr/providers/favourite.dart';

class HomeListItem extends StatefulWidget {
  final String title;
  final bool isFavourite;
  final int id;
  Function markAsFavourite;
  Function removeFromFavourites;
  Function onTabMenuItemHandler;
  HomeListItem({
    Key key,
    this.title,
    this.id,
    this.isFavourite = false,
    this.markAsFavourite,
    this.removeFromFavourites,
    this.onTabMenuItemHandler,
  }) : super(key: key);

  @override
  _HomeListItemState createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  Favourite _favService = new Favourite();
  addToFavourite(String id) async {
    await _favService.addToFavourite(id);
    widget.markAsFavourite(id);
  }

  removeFavouite(String id) async {
    await _favService.removeFromFavourite(id);
    widget.removeFromFavourites(id);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Padding(
      //   padding: EdgeInsets.all(4.0),
      //   child: Icon(
      //     Icons.hand,
      //     color: Theme.of(context).accentColor,
      //     size: 32,
      //   ),
      // ),
      trailing: widget.isFavourite
          ? IconButton(
              onPressed: () => removeFavouite(widget.id.toString()),
              icon: Icon(
                Icons.star_purple500_sharp,
                color: Theme.of(context).accentColor,
                size: 32,
              ),
            )
          : IconButton(
              onPressed: () => addToFavourite(widget.id.toString()),
              icon: Icon(
                Icons.star_border_purple500_sharp,
                color: Theme.of(context).accentColor,
                size: 32,
              ),
            ),
      title: GestureDetector(
          onTap: widget.onTabMenuItemHandler, child: Text(widget.title)),
    );
  }
}
