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

List<String> randomImages = [
  'https://via.placeholder.com/150',
  'https://via.placeholder.com/150x300',
  'https://via.placeholder.com/300x150'
];

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Image.network(
            "https://specials-images.forbesimg.com/imageserve/5d5c30d095808800097d6380/960x0.jpg",
            fit: BoxFit.fitWidth,
            height: 300,
            color: Colors.black38,
            colorBlendMode: BlendMode.darken,
          ),
        ),
        SafeArea(
          minimum: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 34.0,
                ),
              ),
              Spacer(),
              Material(
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Color(0xFFF6AF09),
                    width: 2.0,
                  ),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.photo_filter,
                      size: 28.0,
                      color: Color(0xFFF6AF09),
                    ),
                    onPressed: () {
                      print("clicked");
                    },
                  ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200),
          child: Material(
            color: Color(0xFF191919),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Jake Muller",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Text(
                        "Computer Science",
                        style:
                            TextStyle(color: Color(0xFF484848), fontSize: 18.0),
                      ),
                    ),
                    Text(
                      "Invidunt at clita sadipscing sed consetetur sit. At et dolore sit tempor ea dolor.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: RoundedUnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: Color(0xFFF6BC0A), width: 4.0),
                        insets: EdgeInsets.symmetric(horizontal: 8.0),
                        rounded: true,
                      ),
                      labelColor: Color(0xFFF6BC0A),
                      unselectedLabelColor: Color(0xFF434343),
                      labelStyle: TextStyle(fontSize: 18.0),
                      unselectedLabelStyle: TextStyle(fontSize: 18.0),
                      tabs: [
                        Tab(
                          text: "Feed",
                        ),
                        Tab(
                          text: "Story",
                        ),
                        Tab(
                          text: "Videos",
                        ),
                        Tab(
                          text: "Liked",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          FeedTab(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: Color(0xFFF6BC0A)),
            padding: EdgeInsets.all(4.0),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.fakepersongenerator.com/Face/female/female1022944243378.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
      ],
    );
  }
}

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemBuilder: (context, index) {
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
      itemCount: 20,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
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

class _ClickableImageState extends State<ClickableImage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
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

class RoundedUnderlineTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const RoundedUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.rounded = false,
  })  : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  final bool rounded;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is RoundedUnderlineTabIndicator) {
      return RoundedUnderlineTabIndicator(
          borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
          insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
          rounded: rounded);
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is RoundedUnderlineTabIndicator) {
      return RoundedUnderlineTabIndicator(
          borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
          insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
          rounded: b.rounded);
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final RoundedUnderlineTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;
  bool get isRounded => decoration.rounded;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    assert(isRounded != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()
      ..strokeCap = isRounded ? StrokeCap.round : StrokeCap.square;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
