import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'http://www.udacoding.com/wp-content/uploads/2019/01/49907058_339219876931828_8623740342957807434_n.jpg'
          ),
        ),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (_){
           return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
                'http://www.udacoding.com/wp-content/uploads/2019/01/49907058_339219876931828_8623740342957807434_n.jpg'
            ),
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

