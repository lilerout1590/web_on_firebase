import 'package:flutter/material.dart';
import '../models/timeattack_youtube.dart';

final mainDrawerList = [
  MainDrawerModel(
    id: 1,
    icon: Icons.home,
    title: 'ホーム',
  ),
  MainDrawerModel(
    id: 2,
    icon: Icons.explore,
    title: '探索',
  ),
  MainDrawerModel(
    id: 3,
    icon: Icons.subscriptions,
    title: '登録チャンネル',
  ),
];

final subMainDrawerList = [
  MainDrawerModel(
    id: 1,
    icon: Icons.video_collection,
    title: 'ライブラリ',
  ),
  MainDrawerModel(
    id: 2,
    icon: Icons.history,
    title: '履歴',
  ),
  MainDrawerModel(
    id: 3,
    icon: Icons.slideshow,
    title: '自分の動画',
  ),
  MainDrawerModel(
    id: 4,
    icon: Icons.watch_later,
    title: '後で見る',
  ),
  MainDrawerModel(
    id: 5,
    icon: Icons.thumb_up,
    title: '高く評価した動画',
  ),
];

final playlistDrawerList = [
  PlaylistDrawerModel(
    id: 1,
    icon: Icons.playlist_play,
    title: '何某かのプレイリスト',
  ),
  PlaylistDrawerModel(
    id: 2,
    icon: Icons.playlist_play,
    title: '何某かのプレイリスト',
  ),
  PlaylistDrawerModel(
    id: 3,
    icon: Icons.playlist_play,
    title: '何某かのプレイリスト',
  ),
  PlaylistDrawerModel(
    id: 4,
    icon: Icons.playlist_play,
    title: '何某かのプレイリスト',
  ),
  PlaylistDrawerModel(
    id: 5,
    icon: Icons.playlist_play,
    title: '何某かのプレイリスト',
  ),
];

final subscribeDrawerList = [
  SubscribeDrawerModel(
    id: 1,
    imagePath: 'assets/hiromaru_shoten_wo_text.png',
    title: '何某かの登録チャンネル',
  ),
  SubscribeDrawerModel(
    id: 2,
    imagePath: 'assets/hiromaru_shoten_wo_text.png',
    title: '何某かの登録チャンネル',
  ),
  SubscribeDrawerModel(
    id: 3,
    imagePath: 'assets/hiromaru_shoten_wo_text.png',
    title: '何某かの登録チャンネル',
  ),
  SubscribeDrawerModel(
    id: 4,
    imagePath: 'assets/hiromaru_shoten_wo_text.png',
    title: '何某かの登録チャンネル',
  ),
  SubscribeDrawerModel(
    id: 5,
    imagePath: 'assets/hiromaru_shoten_wo_text.png',
    title: '何某かの登録チャンネル',
  ),
];
