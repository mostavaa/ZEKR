class ZekrItem {
  String Zekr;
  String Source;
  int Count;
  ZekrItem({
    this.Zekr,
    this.Source,
    this.Count = 1,
  });

  ZekrItem.fromJson(Map<String, dynamic> json) {
    Zekr = json['Zekr'];
    Source = json['Source'];
    Count = int.parse(json["Count"]);
  }
}
