import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Container> daftarRangers = new List();

  var warnaRangers = [
    {"nama": "Hijau", "gambar": "hijau.jpg"},
    {"nama": "Hitam", "gambar": "hitam.jpg"},
    {"nama": "Kuning", "gambar": "kuning.jpg"},
    {"nama": "Merah", "gambar": "merah.jpg"},
    {"nama": "Pink", "gambar": "pink.jpg"},
    {"nama": "Putih", "gambar": "putih.jpg"},
    {"nama": "Biru", "gambar": "biru.jpg"},
  ];

  _buatDataList() async {
    for (var i = 0; i < warnaRangers.length; i++) {
      final warnanya = warnaRangers[i];
      final String gambar = warnanya["gambar"];

      daftarRangers.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => DetailGridView(
                        nama: warnanya['nama'],
                        gambar: gambar,
                      )));
            },
            child: new Column(
              children: <Widget>[
                new Hero(
                    tag: warnanya['nama'],
                    child: new Image.asset(
                      "gambar/power_ranger/$gambar",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                ),
                new Text(
                  warnanya['nama'],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _buatDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Custom Grid View'),
          backgroundColor: Colors.green,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: daftarRangers,
          childAspectRatio: 1/1.2,
          // List.generate(12, (index){
          //   return Center(
          //     child: Text(
          //       'Data Ke - $index',
          //       style: Theme.of(context).textTheme.headline,
          //     ),
          //   );
          // }),
        ));
  }
}

class DetailGridView extends StatelessWidget {
  DetailGridView({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          new Container(
            height: 240.0,
            child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "gambar/power_ranger/$gambar",
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
          ),
          BagianNama(
            nama: nama,
          ),
          BagianIcon(),
          BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(fontSize: 20.0, color: Colors.green),
              ),
              Text(
                "$nama@gmail.com",
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
              ),
            ],
          )),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 30.0,
                color: Colors.orange,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          IconTeks(
            iconData: Icons.call,
            teks: "Call",
          ),
          IconTeks(
            iconData: Icons.message,
            teks: "Message",
          ),
          IconTeks(
            iconData: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  IconTeks({this.iconData, this.teks});

  final IconData iconData;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            iconData,
            size: 20.0,
            color: Colors.green,
          ),
          Text(
            teks,
            style: TextStyle(fontSize: 12.0, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            style: TextStyle(fontSize: 14.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
