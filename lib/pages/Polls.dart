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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            color: Color(0xFF600EEA),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.fakepersongenerator.com/Face/male/male20171086735279511.jpg"),
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
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: RawMaterialButton(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                elevation: 0,
                child: Text(
                  "Create a new poll",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
                fillColor: Color(0xFFFDB60A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

class ButtonOrResults extends StatelessWidget {
  final bool showResults;
  final VoidCallback clickButton;
  final String text;
  final double percent;

  ButtonOrResults(
      {this.showResults, this.clickButton, this.text, this.percent});

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
      child = child = Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: RawMaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              onPressed: () {},
              child: Text(this.text, style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w400
              ),),
              fillColor: Color(0xFF885AF2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 5.0,
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: child,
    );
  }
}
