// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

/// An example of using the plugin, controlling lifecycle and playback of the
/// video.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/timeattack_youtube.dart';
import 'package:video_player/video_player.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'videoplayer_for_youtube.dart';
import 'hiromaru_web_test2.dart';

class TimeAttackYouTubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black45),
        ),
      ),
      // home: _App(),
      home: MyHomePage(
        title: '寛〇商店',
      ),
      // home: MyAppTest(),
      // routes: <String, WidgetBuilder>{
      //   '/Top': (BuildContext context) => TopHomePage(title: '寛〇商店 - Top'),
      //   '/TimeAttack': (BuildContext context) =>
      //       APIPage(title: '寛〇商店 - TimeAttack'),
      // },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    // if (orientation == Orientation.portrait) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          leading: MyLeading(),
          backgroundColor: Colors.black,
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: AssetImage('assets/timeattack_youtube_logo.png'),
                ),
              ),
              // MySearchBar(),
              Icon(Icons.mic),
            ],
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.video_call),
            Icon(Icons.grid_on),
            Icon(Icons.notifications),
            Image(
              image: AssetImage('assets/hiromaru_shoten_wo_text.png'),
            ),
          ],
        ),
        // body: VideoPlayerPage(),
        body: _BumbleBeeRemoteVideo(),
        // Container(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Center(
        //         child: Stack(
        //           children: [
        //             Container(
        //               height: 600,
        //               width: 500,
        //               color: Colors.amber,
        //               child: FittedBox(
        //                 fit: BoxFit.contain,
        //                 // child: Text('aaaa'),
        //                 child: _BumbleBeeRemoteVideo(),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       // _BumbleBeeRemoteVideo(),
        //     ],
        //   ),
        // ),
        // body: MyVideoPlayer(),
      ),
    );
    // } else if (size.width > 600) {
    //   return SafeArea(
    //     child: Scaffold(
    //       drawer: MyDrawer(),
    //       appBar: AppBar(
    //         leading: MyLeading(),
    //         backgroundColor: Colors.black,
    //         title: Image.asset(
    //           'assets/hiromaru_shoten_wo_text.png',
    //           height: 100,
    //           fit: BoxFit.contain,
    //         ),
    //         toolbarHeight: 150,
    //         centerTitle: true,
    //       ),
    //       // body: MyVideoPlayer(),
    //     ),
    //   );
    // } else {
    //   return SafeArea(
    //     child: Scaffold(
    //       drawer: MyDrawer(),
    //       appBar: AppBar(
    //         leading: MyLeading(),
    //         backgroundColor: Colors.black,
    //         title: Text(title),
    //         centerTitle: true,
    //       ),
    //       // body: MyVideoPlayer(),
    //     ),
    //   );
    // }
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
                color: Colors.black,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    // tooltip:
                    //     MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                  Image.asset(
                    'assets/timeattack_youtube_logo.png',
                    // height: 25,
                    fit: BoxFit.contain,
                  ),
                  // Text(
                  //   '寛〇商店',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 24,
                  //   ),
                  // ),
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
  _buildMainlistTile() {
    return Container(
      height: mainDrawerList.length * 50,
      child: ListView.builder(
        itemExtent: 50,
        itemCount: mainDrawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(mainDrawerList[index].icon),
                  Text(mainDrawerList[index].title),
                ],
              ),
            ),
            onTap: () => Navigator.pop(context),
            // onTap: () => DialogTest(),
          );
        },
      ),
    );
  }

  _buildSubMainlistTile() {
    return Container(
      height: subMainDrawerList.length * 50,
      child: ListView.builder(
        itemExtent: 50,
        itemCount: subMainDrawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(subMainDrawerList[index].icon),
                  Text(subMainDrawerList[index].title),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  _buildPlaylistTile() {
    return Container(
      height: playlistDrawerList.length * 50,
      child: ListView.builder(
        itemExtent: 50,
        itemCount: playlistDrawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(playlistDrawerList[index].icon),
                  Text(playlistDrawerList[index].title),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  _buildSubscribeTile() {
    return Container(
      height: subscribeDrawerList.length * 50,
      child: ListView.builder(
        itemExtent: 50,
        itemCount: subscribeDrawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      subscribeDrawerList[index].imagePath,
                    ),
                  ),
                  Text(subscribeDrawerList[index].title),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ExpansionCheck(bool check){
    //   final check;
    //   return (myExpansion.);
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.home_repair_service),
                Text('Topページ'),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/Top'),
          // onTap: () => DialogTest(),
        ),
        _buildMainlistTile(),
        Divider(
            // height: 100,
            // thickness: 1.0,
            // color: Colors.black,
            // indent: ,
            // endIndent: ,
            ),
        _buildSubMainlistTile(),
        ExpansionTile(
            // onExpansionChanged: (check) =>ExpansionCheck(check),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  // RotatedBox(
                  //   quarterTurns: 3,
                  //   child: Icon(
                  //     Icons.arrow_back_ios,
                  //   ),
                  // ),
                  // Icon(
                  //   Icons.keyboard_arrow_down,
                  // ),
                  // AnimatedIcon(
                  //   icon: AnimatedIcons.menu_arrow,
                  //   progress: myExpansion,
                  //   semanticLabel: 'Show menu',
                  // ),
                  Text(
                    'もっと見る',
                    // style: TextStyle(
                    //   color: Colors.black,
                    //   fontSize: 16,
                    // fontFamily: 'MSPGOTHIC',
                    // ),
                  ),
                ],
              ),
            ),
            children: [
              _buildPlaylistTile(),
            ]),
        Divider(
            // height: 100,
            // thickness: 1.0,
            // color: Colors.black,
            // indent: ,
            // endIndent: ,
            ),
        ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.video_collection,
                // ),
                Text(
                  '登録チャンネル',
                  // style: TextStyle(
                  // color: Colors.black,
                  // fontSize: 16,
                  // fontFamily: 'MSPGOTHIC',
                  // ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _buildSubscribeTile(),
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

// Search Bar config
class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // buildMap(),
          // buildBottomNavigationBar(),
          FloatingSearchBar(
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            axisAlignment: isPortrait ? 0.0 : -1.0,
            openAxisAlignment: 0.0,
            width: isPortrait ? 600 : 500,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              // Call your model, bloc, controller here.
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: const Icon(Icons.place),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: Colors.accents.map((color) {
                      return Container(height: 112, color: color);
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DialogTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _askedToLead() async {
      // switch (
      await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _askedToLead,
      ),
    );
  }
}

// Video config
class _BumbleBeeRemoteVideo extends StatefulWidget {
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;

  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.srt');
  //   return SubRipCaptionFile(fileContents);
  // }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Container(padding: const EdgeInsets.only(top: 20.0)),
          // const Text('With remote mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _controller.initialize().then((_) {
      // 最初のフレームを描画するため初期化後に更新
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // 動画を表示
            child: VideoPlayer(_controller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // 動画を最初から再生
                  _controller
                      .seekTo(Duration.zero)
                      .then((_) => _controller.play());
                },
                icon: Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {
                  // 動画を再生
                  _controller.play();
                },
                icon: Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {
                  // 動画を一時停止
                  _controller.pause();
                },
                icon: Icon(Icons.pause),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class APIPage extends StatelessWidget {
  final String title;
  const APIPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    // if (orientation == Orientation.portrait) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          leading: MyLeading(),
          backgroundColor: Colors.black,
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: AssetImage('assets/timeattack_youtube_logo.png'),
                ),
              ),
              // MySearchBar(),
              Icon(Icons.mic),
            ],
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.video_call),
            Icon(Icons.grid_on),
            Icon(Icons.notifications),
            Image(
              image: AssetImage('assets/hiromaru_shoten_wo_text.png'),
            ),
          ],
        ),
        // body: VideoPlayerPage(),
        body: _BumbleBeeRemoteVideo(),
        // Container(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Center(
        //         child: Stack(
        //           children: [
        //             Container(
        //               height: 600,
        //               width: 500,
        //               color: Colors.amber,
        //               child: FittedBox(
        //                 fit: BoxFit.contain,
        //                 // child: Text('aaaa'),
        //                 child: _BumbleBeeRemoteVideo(),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       // _BumbleBeeRemoteVideo(),
        //     ],
        //   ),
        // ),
        // body: MyVideoPlayer(),
      ),
    );
    // } else if (size.width > 600) {
    //   return SafeArea(
    //     child: Scaffold(
    //       drawer: MyDrawer(),
    //       appBar: AppBar(
    //         leading: MyLeading(),
    //         backgroundColor: Colors.black,
    //         title: Image.asset(
    //           'assets/hiromaru_shoten_wo_text.png',
    //           height: 100,
    //           fit: BoxFit.contain,
    //         ),
    //         toolbarHeight: 150,
    //         centerTitle: true,
    //       ),
    //       // body: MyVideoPlayer(),
    //     ),
    //   );
    // } else {
    //   return SafeArea(
    //     child: Scaffold(
    //       drawer: MyDrawer(),
    //       appBar: AppBar(
    //         leading: MyLeading(),
    //         backgroundColor: Colors.black,
    //         title: Text(title),
    //         centerTitle: true,
    //       ),
    //       // body: MyVideoPlayer(),
    //     ),
    //   );
    // }
  }
}
