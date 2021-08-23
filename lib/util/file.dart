import 'dart:convert';

import 'package:flutter/material.dart';

class FileHandler {
  static Future readJson(ctx, {filename = "Menu"}) async {
    String data = await DefaultAssetBundle.of(ctx)
        .loadString("assets/data/$filename.json");
    final jsonResult = jsonDecode(data);
    //print(jsonResult);
    return jsonResult;
  }
}
