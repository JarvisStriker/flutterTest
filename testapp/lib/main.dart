import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'support.dart';
import './models/problems.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Support'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, _Support());
              },
              child: Text('Support'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//New Code
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
              onTap: (){
                Navigator.push(context, _ReportProblem());
              },
            ),
            Divider(height: 1.0,),
            ListTile(
              title: Text(
                'View reported problems',
                  style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              onTap: (){
                Navigator.push(context, _ReportedProblem());
              },
            ),
            Divider(height: 1.0,),
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
            Divider(height: 1.0,),

         ];

          return Scaffold(
            appBar: //PreferredSize(
              //preferredSize: Size.fromHeight(54.0),
              //child: 
              AppBar(
              leading: new IconButton(
               icon: new Icon(Icons.keyboard_arrow_left, color: Colors.green, size: 40),
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
            appBar: //PreferredSize(
              //preferredSize: Size.fromHeight(54.0),
              //child: 
              AppBar(
              leading: new IconButton(
               icon: new Icon(Icons.keyboard_arrow_left, color: Colors.green, size: 40),
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

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {

  Widget statusColour(String status){
    MaterialColor _statusColour = Colors.red;
    if(status == "RESOLVED")
      _statusColour = Colors.green;
    return new Text(
      status,
      style: new TextStyle(color: _statusColour, fontSize: 12.0)
    );
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
                        //style: new TextStyle(fontWeight: FontWeight.bold),
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

class _ReportProblem extends MaterialPageRoute<Null> {
   _ReportProblem()
      : super(builder: (BuildContext context) {
         
          return Scaffold(
            appBar: //PreferredSize(
              //preferredSize: Size.fromHeight(54.0),
              //child: 
              AppBar(
              leading: new IconButton(
               icon: new Icon(Icons.keyboard_arrow_left, color: Colors.green, size: 40),
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
          //),
          body: ReportProblem(),
          );

        });
}

class ReportProblem extends StatefulWidget {
  @override
  ReportProblemState createState() {
      return new ReportProblemState();
    }
  }
  

//implement  
class ReportProblemState extends State<ReportProblem> {
  
  File _imageFile;

  @override
  Widget build (BuildContext context){
      return Column(
        children: <Widget>[
          _BorderLessInput(context),
          _ScreenshotAndCount(context),
          Divider(height: 1.0),
        ],
      );
      
  }

  final _controller = TextEditingController();
  Color countColor = Colors.black54;

  Widget _BorderLessInput (BuildContext context) {
    return TextField(
      controller: this._controller,
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        //counterText: '${this._controller.text.length}/1000',
        hintText: "Enter your message here...",
        border: InputBorder.none,
      ),
      inputFormatters: [new LengthLimitingTextInputFormatter(1000),],
      onChanged: (text) => setState(() {}),
    );
  }

  Widget _ScreenshotAndCount (BuildContext context) {
    if(this._controller.text.length == 1000)
      countColor = Colors.red;
    else
      countColor = Colors.black54;
    
    return Row(children: <Widget>[

      Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: InkWell(
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              Text('ADD SCREENSHOT', 
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(width: 5,),
              Icon(Icons.photo, size: 18, color: Colors.green,),
            ], ),
          ),
          onTap: () async => await _pickImage(),
        ),
      ),

      Expanded(child: SizedBox(width: 10),),
      Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
        child: Text(
          '${this._controller.text.length}/1000',
          style: TextStyle(
            color: countColor,
          ),
        ),
      ),            
    ],);
  }

  Future<Null> _pickImage() async {
    final File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this._imageFile = imageFile;
    });
  }
}





   