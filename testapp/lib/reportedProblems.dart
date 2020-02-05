import 'package:flutter/material.dart';
import './models/problems.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  Widget statusColour(String status) {
    MaterialColor _statusColour = Colors.red;
    if (status == "RESOLVED") _statusColour = Colors.green;
    return new Text(status,
        style: new TextStyle(color: _statusColour, fontSize: 12.0));
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new ListTile(
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: new Text(
                    dummyData[i].problem,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                new Text(
                  dummyData[i].date,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: statusColour(dummyData[i].status),
            ),
          ),
          new Divider(
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
