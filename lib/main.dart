import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui show Image;
import 'package:flutter/material.dart';
import 'package:collegesocial/pages/Home.dart';
import 'package:collegesocial/pages/Discover.dart';
import 'package:collegesocial/pages/Polls.dart';
import 'package:collegesocial/pages/Message.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      home: AppWithBottomBar(),
    );
  }
}

class AppWithBottomBar extends StatefulWidget {
  @override
  _AppWithBottomBarState createState() => _AppWithBottomBarState();
}

class _AppWithBottomBarState extends State<AppWithBottomBar> {
  PageStorageBucket _pageStorageBucket;
  int selectedPage;
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey("Home"),
    ),
    DiscoverPage(
      key: PageStorageKey("Discover"),
    ),
    PollsPage(
      key: PageStorageKey("Polls"),
    ),
    MessagePage(
      key: PageStorageKey("Message"),
    ),
    ProfilePage(
      key: PageStorageKey("Profile"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageStorageBucket = PageStorageBucket();
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0D),
      body: PageStorage(bucket: _pageStorageBucket, child: pages[selectedPage]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0F0F0D),
          border: Border(
            top: BorderSide(
              color: Color(0xFF121312),
              width: 2.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (newPage) => setState(() => selectedPage = newPage),
          currentIndex: selectedPage,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          unselectedItemColor: Color(0xFF4E4E4D),
          selectedItemColor: Color(0xFFF6BB0A),
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Discover"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll),
              title: Text("Polls"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline),
              title: Text("Message"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

List<String> randomImages = ['https://via.placeholder.com/150', 'https://via.placeholder.com/150x300', 'https://via.placeholder.com/300x150'];

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://specials-images.forbesimg.com/imageserve/5d5c30d095808800097d6380/960x0.jpg",
          fit: BoxFit.fitWidth,
          height: 300,
        ),
        Column(
          children: <Widget>[
            AppBar(),
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0.0,
                  pinned: true,
                  expandedHeight: 300.0,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(15.0),
                    centerTitle: false,
                    stretchModes: [StretchMode.blurBackground],
                    title: Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(15.0),
                  sliver: SliverStaggeredGrid.countBuilder(
                    itemBuilder: (context, index) {
                      //https://www.heidelberg.edu/sites/default/files/styles/865width/public/images/program-images/computer-science-2.jpg?itok=9N2z12gj

//              Completer<ui.Image> completer = Completer<ui.Image>();
//              var netImage = NetworkImage(randomImages[new Random().nextInt(randomImages.length)]);
//              netImage.resolve(ImageConfiguration()).addListener(ImageStreamListener((ImageInfo image, bool _) => completer.complete(image.image)));
//
//              return Material(
//                color: Colors.transparent,
//                child: InkWell(
//                  onTap: () {},
//                  highlightColor: Colors.redAccent,
//                  child: Ink.image(
//                    image: netImage,
//                    fit: BoxFit.fitWidth,
//                  ),
//                ),
//              );

                      return ClickableImage(
                        url: randomImages[new Random().nextInt(randomImages.length)],
                        onClick: () {
                          print("tapped: " + index.toString());
                        },
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.fit(1);
                    },
                    crossAxisCount: 2,
                    itemCount: 20,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ClickableImage extends StatefulWidget {
  final String url;
  final VoidCallback onClick;

  ClickableImage({this.url, this.onClick});

  @override
  _ClickableImageState createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black26,
    ).animate(_controller)
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      onTap: widget.onClick,
      onTapCancel: () {
        _controller.reverse();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          widget.url,
          fit: BoxFit.contain,
          color: animation.value,
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}
