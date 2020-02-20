import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PollsPage extends StatefulWidget {
  PollsPage({Key key}) : super(key: key);

  @override
  _PollsPageState createState() => _PollsPageState();
}

class _PollsPageState extends State<PollsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(
          flex: 8,
        ),
        Expanded(
          flex: 30,
          child: Card(
            margin: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
            color: Color(0xFF5C00EE),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(""),
                        ),
                        Text("Luke"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Hello"),
                  ),
                  Expanded(
                    flex: 2,
                    child: ButtonOrResults(
                      showResults: false,
                      text: "Make Sense",
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ButtonOrResults(
                      showResults: true,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ButtonOrResults(
                      showResults: true,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ButtonOrResults(
                      showResults: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        MaterialButton(
          onPressed: () {},
          child: Text(
            "Create a new poll",
          ),
          color: Color(0xFFFDB60A),
        )
      ],
    );
  }
}

class ButtonOrResults extends StatelessWidget {
  final bool showResults;
  final VoidCallback clickButton;
  final String text;
  final double percent;

  ButtonOrResults({this.showResults, this.clickButton, this.text, this.percent});

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (showResults) {
      child = Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xFF885AF2),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xFF885AF2),
            ),
          ),
        ],
      );
    } else {
      child = RawMaterialButton(
        onPressed: () {},
        child: Text(this.text),
        fillColor: Color(0xFF885AF2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0.0,
      );
    }
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: child,
    );
  }
}
