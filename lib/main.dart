import 'package:flutter/material.dart';
// import 'apps/hero_test.dart';
// import 'apps/hero_test2.dart';
// import 'apps/hero_test_gridview.dart';
// import 'apps/hero_test_gridview2.dart';
// import 'apps/hero_test_gridview3.dart';
// import 'apps/pageview_test.dart';
// import 'apps/pageview_image.dart';
// import 'apps/tabbar_test.dart';
// import 'apps/tabbar_MLnPG.dart';
// import 'apps/tabbar_MLnPG2.dart';
// import 'apps/sliver_test.dart';
// import 'apps/sliver_test2.dart';
// import 'apps/card_test.dart';
// import 'apps/nested_list_screen.dart';
// import 'apps/hiromaru_web_test.dart';
import 'apps/hiromaru_web_test2.dart';
// import 'apps/videoplayer_test.dart';
// import 'apps/timeattack_youtube.dart';
// import 'outerapps/sample/ListScreen.dart';

void main() {
  // runApp(MyTestApp());
  // runApp(NestedListScreen());
  // runApp(CardTestApp());
  // runApp(VideoPlayerApp());
  // runApp(TimeAttackYouTubeApp());
  runApp(HiromaruWebApp());
  // runApp(HeroApp());
  // runApp(SliverApp());
  // runApp(TabBarMLnPGApp());
  // runApp(TabBarApp());
  // runApp(PageViewApp());
  // runApp(PageViewImageApp());
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Hello flutter!!'),
            )
          ],
        ),
      ),
    );
  }
}
