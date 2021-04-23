import 'package:flutter/material.dart';
import '../models/hero_test2.dart';
import '../database/hero_test2.dart';
// import 'package:hiromaru_web/hiro_sho_logo_icons.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'timeattack_youtube.dart';

class HiromaruWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black45))),
      home: TopHomePage(title: '寛〇商店'),
      // home: MyAppTest(),
      routes: <String, WidgetBuilder>{
        '/Top': (BuildContext context) => TopHomePage(title: '寛〇商店 - Top'),
        '/TimeAttack': (BuildContext context) =>
            APIPage(title: '寛〇商店 - TimeAttack'),
      },
    );
  }
}

class TopHomePage extends StatelessWidget {
  final String title;
  const TopHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    if (orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            leading: MyLeading(),
            backgroundColor: Colors.black,
            title: Text(title),
            centerTitle: true,
          ),
          body: MyTabBar(),
        ),
      );
    } else if (size.width > 600) {
      return SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            leading: MyLeading(),
            backgroundColor: Colors.black,
            title: Image.asset(
              'assets/hiromaru_shoten_wo_text.png',
              height: 100,
              fit: BoxFit.contain,
            ),
            toolbarHeight: 150,
            centerTitle: true,
          ),
          body: MyTabBar(),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            leading: MyLeading(),
            backgroundColor: Colors.black,
            title: Text(title),
            centerTitle: true,
          ),
          body: MyTabBar(),
        ),
      );
    }
  }
}

// AppBar config
class MyLeading extends StatelessWidget {
  MyLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );
  }
}

// Drawer config
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 70.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/hiromaru_shoten_wo_text.png',
                  //   height: 25,
                  //   color: Colors.black,
                  //   fit: BoxFit.contain,
                  // ),
                  Text(
                    '寛〇商店',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BuildListTile(),
        ],
      ),
    );
  }
}

// Drawer contents config
class BuildListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _askedToLead() async {
      // switch (
      await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // title: SingleChildScrollView(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [],
            //   ),
            // ),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1020726048533516288/Tvn6PO4I_400x400.jpg'),
                  ),
                  Image(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  Text('aaaa'),
                  SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text('Close'),
                      )),
                ],
              ),
            ],
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' -    Top',
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 16,
              //   fontFamily: 'MSPGOTHIC',
              // ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' -    Contact me',
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 16,
              //   fontFamily: 'MSPGOTHIC',
              // ),
            ),
          ),
          onTap: () {
            _askedToLead();
          },
        ),
        ListTile(
          title: Text(' -    Time Attack - YouTube page'),
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     // fullscreenDialog: false,
            //     fullscreenDialog: true,
            //     builder: (BuildContext context) => APIPage(title: '寛〇商店'),
            //   ),
            // );
            Navigator.pushNamed(context, '/TimeAttack');
          },
        ),
        ListTile(
          title: Text('test'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('test'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

// Actions config
class MyIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.shopping_cart,
        size: 24,
      ),
      tooltip: 'Open shopping cart',
      onPressed: () {
        // handle the press
      },
    );
  }
}

// TabBar config
class ColoredTabBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget tabBar;
  final Color color;
  ColoredTabBar({required this.tabBar, required this.color});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: tabBar,
    );
  }

  @override
  Size get preferredSize => tabBar.preferredSize;
}

class MyTabBar extends StatelessWidget {
  _buildTabs() {
    return TabBar(
      // automaticIndicatorColorAdjustment: true,
      // labelColor: Colors.black,
      // labelStyle: TextStyle(color: Colors.black),
      // unselectedLabelColor: Colors.white,
      // unselectedLabelStyle: TextStyle(color: Colors.white),
      // indicator: BoxDecoration(
      //   color: Colors.white,
      //   // image: const DecorationImage(
      //   //   image: NetworkImage(
      //   //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      //   //   fit: BoxFit.cover,
      //   // ),
      //   shape: BoxShape.rectangle,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black45,
      //     ),
      //   ],
      //   // borderRadius: BorderRadius.circular(12),
      // ),
      indicatorColor: Colors.white70,
      indicatorWeight: 8.0,
      tabs: <Widget>[
        Tab(
          text: 'Programming',
          icon: Icon(
            Icons.devices,
            color: Colors.white,
            // color: Colors.white,
            size: 24,
          ),
        ),
        Tab(
          text: 'Modeling',
          icon: Icon(
            Icons.precision_manufacturing_rounded,
            color: Colors.white,
            // color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTabView() {
    return [
      Center(
        child: ContentsView(contentsList: programmingList),
      ),
      Center(
        child: ContentsView(contentsList: modelingList),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: ColoredTabBar(
          tabBar: _buildTabs(),
          color: Colors.black,
        ),
        body: TabBarView(
          children: _buildTabView(),
        ),
      ),
    );
  }
}

// リストを表示してるページ
class ContentsView extends StatelessWidget {
  final List<ItemModel> contentsList;
  ContentsView({Key? key, required this.contentsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisExtent: 300,
              mainAxisSpacing: 25,
              childAspectRatio: 1,
              crossAxisSpacing: 1,
            ),
            itemCount: contentsList.length,
            itemBuilder: (BuildContext context, int productIndex) {
              return GestureDetector(
                child: Card(
                  margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: contentsList[productIndex].backgroundColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              contentsList[productIndex].imagePath[0],
                              fit: BoxFit.fitWidth,
                              height: 100,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                contentsList[productIndex].title,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                contentsList[productIndex].subtitle,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // fullscreenDialog: false,
                      fullscreenDialog: true,
                      builder: (BuildContext context) => DetailPage3(
                        item: contentsList[productIndex],
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 300,
              // childAspectRatio: 1,
              mainAxisSpacing: 25,
              crossAxisSpacing: 1,
            ),
            itemCount: contentsList.length,
            itemBuilder: (BuildContext context, int productIndex) {
              return GestureDetector(
                child: Card(
                  margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: contentsList[productIndex].backgroundColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              contentsList[productIndex].imagePath[0],
                              fit: BoxFit.fitWidth,
                              height: 100,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                contentsList[productIndex].title,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                contentsList[productIndex].subtitle,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => DetailPage3(
                        item: contentsList[productIndex],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}

// 詳細ページ
class DetailPage3 extends StatelessWidget {
  final ItemModel item;
  DetailPage3({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'title' + item.id,
          child: Material(
            color: Colors.transparent,
            child: Text(
              item.title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        // backgroundColor: item.backgroundColor,
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'background' + item.id,
            child: Container(
              color: item.backgroundColor,
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'image' + item.id,
                  child: _buildHorizontalItem(context, item),
                ),
                Hero(
                  tag: 'subtitle' + item.id,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      item.subtitle,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 画像のカルーセル表示設定：画像数に合わせたページの生成
  Widget _buildHorizontalItem(BuildContext context, ItemModel item) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: item.imagePath.length,
        itemBuilder: (context, horizontalIndex) =>
            _buildHorizontalView(context, item, horizontalIndex),
      ),
    );
  }

  // 画像のカルーセル表示設定：各ページの表示設定
  Widget _buildHorizontalView(
      BuildContext context, ItemModel item, int horizontalIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // child: Card(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              item.imagePath[horizontalIndex],
            ),
            // child: Image.asset('assets/studies/starter_card.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
