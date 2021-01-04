import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page Image Demo'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(child: Column(
          children: <Widget>[
            Image.asset('gambar/tayo.jpg'),
            Text('Assets Image',style: TextStyle(fontSize: 30.0),),
            Hero(
              tag: 'imageHero',
              child: Image.network(
                  'http://www.udacoding.com/wp-content/uploads/2019/01/49907058_339219876931828_8623740342957807434_n.jpg'
              ),
            ),
            Text('Internet Image',style: TextStyle(fontSize: 30.0),),
          ],
        ),)
      ),
    );
  }
}
