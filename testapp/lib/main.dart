import 'package:flutter/material.dart';
import 'reportedProblems.dart';
import 'reportProblem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Support',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Support App Preview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              height: 45,
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  Navigator.push(context, _Support());
                },
                child: Text('Support'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Support extends MaterialPageRoute<Null> {
  _Support()
      : super(builder: (BuildContext context) {
          var listTiles = <Widget>[
            ListTile(
              title: Text(
                'Report a problem',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              onTap: () {
                Navigator.push(context, _ReportProblem());
              },
            ),
            Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text(
                'View reported problems',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              onTap: () {
                Navigator.push(context, _ReportedProblem());
              },
            ),
            Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text(
                'FAQ',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
            ),
            Divider(
              height: 1.0,
            ),
          ];

          return Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.keyboard_arrow_left,
                    color: Colors.green, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: Text(
                'Support',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              backgroundColor: Colors.grey[300],
              elevation: 3.0,
            ),
            //),
            body: ListView(children: listTiles),
          );
        });
}

class _ReportedProblem extends MaterialPageRoute<Null> {
  _ReportedProblem()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.keyboard_arrow_left,
                    color: Colors.green, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: Text(
                'Your reported problems',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              backgroundColor: Colors.grey[300],
              elevation: 3.0,
            ),
            //),
            body: ChatScreen(),
          );
        });
}

class _ReportProblem extends MaterialPageRoute<Null> {
  _ReportProblem()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.keyboard_arrow_left,
                    color: Colors.green, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: Text(
                'Report a problem',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              backgroundColor: Colors.grey[300],
              elevation: 3.0,
            ),
            body: ReportProblem(),
          );
        });
}
