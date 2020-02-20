import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  bool isShrunk = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (isShrink != isShrunk) {
      setState(() {
        isShrunk = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients && _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          elevation: 10.0,
          backgroundColor: Color(0xFF0F0F0D),
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(15.0),
                  centerTitle: false,
                  title: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Color(0xFFF6AF09),
                      width: 2.0,
                    ),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    size: 28.0,
                    color: Color(0xFFF6AF09),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
//          SizedBox(
//            height: 100,
//            child: CustomScrollView(
//              primary: false,
//              scrollDirection: Axis.horizontal,
//              slivers: <Widget>[
//                SliverList(
//                  delegate: SliverChildBuilderDelegate(
//                    (context, index) {
//                      return Container(
//                        height: 100,
//                        width: 75,
//                        decoration: BoxDecoration(color: Colors.redAccent),
//                      );
//                    },
//                  ),
//                )
//              ],
//            ),
//          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                color: Color(0xFF191919),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //picture
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "",
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flex(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Text(
                                    "Name Here",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "10 mins ago",
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 38.0,
                                color: Color(0xFF7C7C7C),
                              ),
                              onPressed: () {}),
                        ],
                      ), //header
                      Text(
                        "Amazing trip with my new frieds 😍😍",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      //image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network("https://www.frommers.com/system/photos/photos500/1541-42954.jpg"),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 10,
                            child: RawMaterialButton(
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.message,
                                    color: Color(0xFF7D7E7A),
                                  ),
                                  Text(
                                    " 14 Comment",
                                    style: TextStyle(
                                      color: Color(0xFF7D7E7A),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                              fillColor: Color(0xFF20201C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Spacer(),
                          Flexible(
                            flex: 10,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 0,
                              fillColor: Color(0xFF20201C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xFFF3303D),
                                  ),
                                  Text(
                                    " 20k Liked",
                                    style: TextStyle(
                                      color: Color(0xFFF3303D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
