import 'package:flutter/material.dart';
import 'package:flutter_basic_5/image_screen.dart';
import 'package:flutter_basic_5/number_picker.dart';
import 'package:flutter_basic_5/pengembalian_data.dart';
import 'package:flutter_basic_5/pengiriman_data.dart';
import 'animation_screen.dart';
import 'gridview_screen.dart';
import 'horizontal_listview_screen.dart';
import 'listview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListViewScreen(),
      routes: <String,WidgetBuilder>{
        '/listview':(BuildContext context) => new ListViewScreen(),
        '/horizontal_list':(BuildContext context) => new HorizontalListViewScreen(),
        '/gridview':(BuildContext context) => new GridViewScreen(),
        '/animation':(BuildContext context) => new AnimationScreen(),
        '/sent_data':(BuildContext context) => new NewsScreen(),
        '/request_data':(BuildContext context) => new RequestDataScreen(),
        '/image':(BuildContext context) => new ImageDemoScreen(),
        '/number_picker':(BuildContext context) => new NumberPickerScreen(),
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
