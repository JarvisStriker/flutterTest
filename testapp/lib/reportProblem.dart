import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';

class ReportProblem extends StatefulWidget {
  @override
  ReportProblemState createState() {
    return new ReportProblemState();
  }
}

class ReportProblemState extends State<ReportProblem> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _BorderLessInput(context),
        _ScreenshotAndCount(context),
        Divider(height: 1.0, thickness: 1),
        _EmailBox(context),
        Divider(height: 1.0, thickness: 1),
        _SendButton(context),
      ],
    );
  }

  final _problemcontroller = TextEditingController();
  final _mailcontroller = TextEditingController();
  bool isMailValid = false;
  Color countColor = Colors.black54;

  bool mailValidity() {
    isMailValid = EmailValidator.validate(this._mailcontroller.text);
    return isMailValid;
  }

  Widget _BorderLessInput(BuildContext context) {
    return TextField(
      controller: this._problemcontroller,
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: "Enter your message here...",
        border: InputBorder.none,
      ),
      inputFormatters: [
        new LengthLimitingTextInputFormatter(1000),
      ],
      onChanged: (text) => setState(() {}),
    );
  }

  Widget _ScreenshotAndCount(BuildContext context) {
    if (this._problemcontroller.text.length == 1000)
      countColor = Colors.red;
    else
      countColor = Colors.black54;

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: InkWell(
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ADD SCREENSHOT',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.photo,
                    size: 18,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            onTap: () async => await _pickImage(),
          ),
        ),
        Expanded(
          child: SizedBox(width: 10),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
          child: Text(
            '${this._problemcontroller.text.length}/1000',
            style: TextStyle(
              color: countColor,
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> _pickImage() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this._imageFile = imageFile;
    });
  }

  Widget _EmailBox(BuildContext context) {
    return new TextFormField(
      controller: this._mailcontroller,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        labelText: 'Enter your email',
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _SendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ButtonTheme(
              height: 45,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(10),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () => mailValidity()
                    ? Navigator.push(context, _SubmitSuccess())
                    : _mailcontroller.clear(),
                child: new Text("Send message"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitSuccess extends MaterialPageRoute<Null> {
  _SubmitSuccess()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: new Container(),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                  onPressed: () => popTwice(context),
                ),
              ],
            ),
            body: SubmitSuccess(),
          );
        });

  static void popTwice(BuildContext context) {
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }
}

class SubmitSuccess extends StatefulWidget {
  @override
  SubmitSuccessState createState() {
    return new SubmitSuccessState();
  }
}

class SubmitSuccessState extends State<SubmitSuccess> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/greentick.png',
            scale: 3,
          ),
          Text(
            'Message sent!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              '''A MoneyVerbs team member \nwill reachout to you soon''',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
