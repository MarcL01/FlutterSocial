import 'dart:convert';

import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static final _textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Discover",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: true,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverChildrenDelegate(
            TextField(
              key: _textKey,
              decoration: InputDecoration(
                fillColor: Color(0xFF151613),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(15.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                DiscoverCategory category = categories[index];
                return DiscoverCard(
                  category: category,
                );
              },
              childCount: categories.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: .8),
          ),
        ),
      ],
    );
  }
}

class DiscoverCard extends StatelessWidget {
  final DiscoverCategory category;

  DiscoverCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
            image: NetworkImage(category.background), fit: BoxFit.cover),
      ),
      child: Material(
        type: MaterialType.card,
        color: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(category.pfp),
              ),
              Text(
                category.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              ),
              Text(
                category.major,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DiscoverCategory> categories = [
  DiscoverCategory(
      background:
          "https://www.irishtimes.com/polopoly_fs/1.4029963.1569503430!/image/image.jpg_gen/derivatives/box_620_330/image.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Larry burton",
      major: "Computer Science"),
  DiscoverCategory(
      background:
          "https://www.pandotrip.com/wp-content/uploads/2018/03/Woman-in-the-Taj-Mahal-India.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Daria darla",
      major: "Biology"),
  DiscoverCategory(
      background:
          "https://www.pandotrip.com/wp-content/uploads/2018/03/Golden-Gate-Bridge-San-Francisco-California-USA.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Nathan Drake",
      major: "Business Administration"),
  DiscoverCategory(
      background:
          "https://www.catster.com/wp-content/uploads/2015/06/blankets-ranked-2.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Alan Lallana",
      major: "Computer Science"),
  DiscoverCategory(
      background:
          "https://www.pandotrip.com/wp-content/uploads/2018/03/Amazing-view-of-The-Great-Wall-of-China.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Larry burton",
      major: "Computer Science"),
  DiscoverCategory(
      background:
          "https://www.pandotrip.com/wp-content/uploads/2018/03/Woman-looking-at-Mount-Fuji-Japan.jpg",
      pfp:
          "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg",
      name: "Larry burton",
      major: "Computer Science"),
];

class DiscoverCategory {
  String background;
  String pfp;
  String name;
  String major;

  DiscoverCategory({
    this.background,
    this.pfp,
    this.name,
    this.major,
  });
}

class _SliverChildrenDelegate extends SliverPersistentHeaderDelegate {
  _SliverChildrenDelegate(this.child);

  @override
  double get minExtent => 30;
  @override
  double get maxExtent => 30;

  final TextField child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  bool shouldRebuild(_SliverChildrenDelegate oldDelegate) {
    return false;
  }
}
