import 'package:flutter/material.dart';

// リストに表示するデータモデル
class ItemModel {
  String id;
  String title;
  String subtitle;
  List<String> imagePath;
  Color themeColor;
  Color backgroundColor;

  ItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.themeColor,
    required this.backgroundColor,
  });
}
