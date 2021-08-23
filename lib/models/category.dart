class ZekrCategory {
  int Id;
  String Title;
  bool isFavourite;
  ZekrCategory({
    this.Id,
    this.Title,
    this.isFavourite,
  });

  ZekrCategory.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Title = json['Title'];
    isFavourite = false;
  }
}
