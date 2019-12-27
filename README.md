# digit_to_persian_word

The Flutter package for changing digit to the Persian word and add separate to an integer

demo:

![](example.png)

## Add dependency
```
dependencies:
  digit_to_persian_word: ^1.0.5
```
## Usage
```dart
import 'package:flutter/material.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';


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
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Digit To Persian Word'"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //تبدیل رقم به حروف بدون تبدیل اعداد
          Text(DigitToWord.toWord("123456",StrType.NumWord,isMoney: true)),// 123 هزارو 456 تومان
          //)تبدیل عدد به حروف همراه با تبدیل اعداد
          Text(DigitToWord.toWord("123456",StrType.StrWord),),//صد و بیست و سه هزارو چهارصدو پنجاه و شش
          //تبدیل رقم به حروف 
          Text(DigitToWord.toWord("123.456",StrType.NumWord,isMoney: true,separator: ".")),// 123 هزارو 456 تومان
          //جدا سازی سه رقمی اعداد به صورت معمول
          Text(DigitFormat.convert("123456",separator: ","),),//123,456
          //به جدا سازی سه رقمی اعداد به صورت (TextInputFormatter)
          TextFormField(inputFormatters: [DigitInputFormat()]),
        ],
      ),
    );
  }
}

```
## example
[example](https://github.com/resfandiari/digit_to_persian_word/tree/master/example)

An example showing how to use
