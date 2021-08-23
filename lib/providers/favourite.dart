import 'package:shared_preferences/shared_preferences.dart';

class Favourite {
  List<String> _favourites = new List<String>();
  // List<String> get favourites {
  //   return _favourites;
  // }

  Future<bool> _saveFavourites(List<String> favs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList("fav", favs);
  }

  Future<bool> addToFavourite(String id) async {
    List<String> favourites = await getFavourites();
    if (favourites == null) favourites = new List<String>();
    if (!favourites.contains(id)) {
      favourites.add(id);
      return await _saveFavourites(favourites);
    }
    return true;
  }

  Future<List<String>> getFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favIds = prefs.getStringList("fav");
    if (favIds == null) favIds = new List<String>();
    _favourites = favIds;
    return favIds;
  }

  Future<bool> removeFromFavourite(String id) async {
    List<String> favourites = await getFavourites();
    if (favourites != null && favourites.contains(id)) {
      if (favourites.remove(id)) return await _saveFavourites(favourites);
    }
    return true;
  }

  bool isFavourite(String id) {
    if (_favourites != null && _favourites.isNotEmpty)
      return _favourites.contains(id);
    return false;
  }
}
