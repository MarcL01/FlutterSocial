import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
            title: Text("Discover"),
            centerTitle: true,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(15.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                //https://www.heidelberg.edu/sites/default/files/styles/865width/public/images/program-images/computer-science-2.jpg?itok=9N2z12gj
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(image: NetworkImage("https://www.heidelberg.edu/sites/default/files/styles/865width/public/images/program-images/computer-science-2.jpg?itok=9N2z12gj"), fit: BoxFit.cover),
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
                            backgroundImage: NetworkImage(""),
                          ),
                          Text(
                            "Name Here",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "Major",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: .9),
          ),
        ),
      ],
    );
  }
}
