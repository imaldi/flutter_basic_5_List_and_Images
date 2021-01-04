import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation App"),
        backgroundColor: Colors.green,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("WELCOME"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Horizontal List View"),
              trailing: new Icon(Icons.info),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/horizontal_list');
              },
            ),
            new ListTile(
              title: new Text("Grid View"),
              trailing: new Icon(Icons.phone),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/gridview');
              },
            ),
            new ListTile(
              title: new Text("Animation"),
              trailing: new Icon(Icons.accessibility),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/animation');
              },
            ),
            new ListTile(
              title: new Text("Sent Data Demo"),
              trailing: new Icon(Icons.send),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/sent_data');
              },
            ),
            new ListTile(
              title: new Text("Request Data Demo"),
              trailing: new Icon(Icons.autorenew),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/request_data');
              },
            ),
            new ListTile(
              title: new Text("Image Demo"),
              trailing: new Icon(Icons.image),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/image');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person'),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Mail'),
          ),
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Alarm'),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
      )
    );
  }
}
