import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  var etSearch = new TextEditingController();
  bool firstSearch = true;
  String query = "";

  //data list
  List<String> dataList;
  List<String> filterList;

  @override
  void initState() {
    super.initState();
    dataList = new List<String>();
    dataList = [
      "Snake",
      "Elephant",
      "Cats",
      "Dog",
      "Orion",
      "Boomerang",
      "Pelican",
      "Ghost",
      "Eagle",
      "Horse Head",
      "Elephant Trunk",
      "Butterfly"
    ];

    //sort data
    dataList.sort();
  }

  _ListViewScreenState() {
    etSearch.addListener(() {
      if (etSearch.text.isEmpty) {
        setState(() {
          firstSearch = true;
          query = "";
        });
      } else {
        //data tidak kosong
        setState(() {
          firstSearch = false;
          query = etSearch.text;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation App"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("WELCOME"),
            ),
            Divider(),
            ListTile(
              title: Text("Horizontal List View"),
              trailing: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/horizontal_list');
              },
            ),
            ListTile(
              title: Text("Grid View"),
              trailing: Icon(Icons.phone),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/gridview');
              },
            ),
            ListTile(
              title: Text("Animation"),
              trailing: Icon(Icons.accessibility),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/animation');
              },
            ),
            ListTile(
              title: Text("Sent Data Demo"),
              trailing: Icon(Icons.send),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/sent_data');
              },
            ),
            ListTile(
              title: Text("Request Data Demo"),
              trailing: Icon(Icons.autorenew),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/request_data');
              },
            ),
            ListTile(
              title: Text("Image Demo"),
              trailing: Icon(Icons.image),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/image');
              },
            ),
            ListTile(
              title: Text("Number Picker Demo"),
              trailing: Icon(Icons.language),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/number_picker');
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          children: [
            _createSearchView(),
            firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
      // ListView(
      //   children: <Widget>[
      //     ListTile(
      //       leading: Icon(Icons.person),
      //       title: Text('Person'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.mail),
      //       title: Text('Mail'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.album),
      //       title: Text('Album'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.alarm),
      //       title: Text('Alarm'),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.map),
      //       title: Text('Map'),
      //     ),
      //   ],
      // )
    );
  }

  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: TextField(
        controller: etSearch,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.green),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //widget untuk listview
  Widget _createListView() {
    return Flexible(
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 5.0,
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Text("${dataList[index]}"),
              ),
            );
          }),
    );
  }

  Widget _performSearch() {
    filterList = new List<String>();
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return Flexible(
      child: ListView.builder(
          itemCount: filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Text('${filterList[index]}'),
              ),
            );
          }),
    );
  }
}
