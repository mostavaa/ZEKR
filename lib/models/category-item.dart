import 'package:zekr/models/zekr.dart';

class ZekrCategoryItem {
  int Id;
  String Title;
  bool Scrollable;
  List<ZekrItem> Content;
  ZekrCategoryItem({
    this.Id,
    this.Title,
    this.Scrollable = false,
    this.Content,
  });

  ZekrCategoryItem.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Title = json['Title'];
    Scrollable = json["Scrollable"];
    Scrollable = json["Scrollable"];
    Content =
        json["Content"].map<ZekrItem>((e) => ZekrItem.fromJson(e)).toList();
  }
}
