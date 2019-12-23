import 'package:flutter/material.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Digit To Persian Word'),
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
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TextEditingController();
  }


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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _controller,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Vazir"
                ),
                onChanged: (str)=>setState(() {}),
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 10, right: 5, bottom: 10, left: 5),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2)),
                  errorStyle: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DigitToWord.change(digit: _controller.value.text),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  fontFamily: "Vazir"
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
