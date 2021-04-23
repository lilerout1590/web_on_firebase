import 'package:flutter/material.dart';

class MainDrawerModel {
  int id;
  IconData icon;
  String title;

  MainDrawerModel({
    required this.id,
    required this.icon,
    required this.title,
  });
}

class PlaylistDrawerModel {
  int id;
  IconData icon;
  String title;

  PlaylistDrawerModel({
    required this.id,
    required this.icon,
    required this.title,
  });
}

class SubscribeDrawerModel {
  int id;
  String imagePath;
  String title;
  SubscribeDrawerModel({
    required this.id,
    required this.imagePath,
    required this.title,
  });
}
