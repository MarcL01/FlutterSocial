import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<MapEntry<DateTime, List<User>>> messageData = [
  MapEntry(DateTime.now(), [
    User(pfpSRC: "https://www.fakepersongenerator.com/Face/female/female1022944243378.jpg", name: "Ujang Henderson", lastMessage: "Whatssup bro are you free now? Let's play fornite, tell me if you avalable"),
    User(pfpSRC: "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg", name: "Marco Maradona", lastMessage: "Hi, Did you finish your task today?"),
  ]),
  MapEntry(DateTime.now().subtract(Duration(days: 1)), [
    User(pfpSRC: "https://www.fakepersongenerator.com/Face/male/male1085820200928.jpg", name: "Sherry Birkin", lastMessage: "Congratulations on your win in the karate tournament, I can't imagine you winning!"),
    User(pfpSRC: "https://www.fakepersongenerator.com/Face/male/male20161086415248322.jpg", name: "Like Hemmings", lastMessage: "Can I borrow your guitar, because my guitar is broken"),
  ])
];

class User {
  final String pfpSRC;
  final String name;
  final String lastMessage;

  User({this.pfpSRC, this.name, this.lastMessage});
}

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                    "Message",
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
                    Icons.mail_outline,
                    size: 28.0,
                    color: Color(0xFFF6AF09),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                DateTime _date = messageData[index].key;
                DateTime date = DateTime(_date.year, _date.month, _date.day);
                DateTime _now = DateTime.now();
                DateTime today = DateTime(_now.year, _now.month, _now.day);
                String dateString;
                if (date.isAtSameMomentAs(today)) {
                  dateString = "Today";
                } else if (date.isAtSameMomentAs(today.subtract(Duration(days: 1)))) {
                  dateString = "Yesterday";
                } else if (date.isBefore(today.subtract(Duration(days: 7)))) {
                  dateString = DateFormat.yMMMMEEEEd().format(date);
                } else {
                  dateString = "Previous - " + DateFormat.E().format(date);
                }
                List<Widget> children = [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, right: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10.0),
                          child: Text(
                            dateString,
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.white30,
                          ),
                        )
                      ],
                    ),
                  )
                ];
                messageData[index].value.forEach((user) {
                  children.add(MessageCard(
                    user: user,
                    onClick: (user) {
                      print("Clicked: " + user.name);
                    },
                  ));
                });
                return Column(
                  children: children,
                );
              },
              childCount: messageData.length,
            ),
          ),
        ),
      ],
    );
  }
}

typedef UserCardCallback = void Function(User user);

class MessageCard extends StatelessWidget {
  final User user;
  final UserCardCallback onClick;

  MessageCard({this.user, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF191919),
      child: InkResponse(
        onTap: () => onClick(this.user),
        splashColor: Colors.white30,
        highlightShape: BoxShape.rectangle,
        containedInkWell: true,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                minRadius: 30,
                backgroundImage: NetworkImage(user.pfpSRC),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
//              direction: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      user.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      user.lastMessage,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
