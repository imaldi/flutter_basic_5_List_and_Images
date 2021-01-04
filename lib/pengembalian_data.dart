import 'package:flutter/material.dart';


class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
      child: Text('Silahkan Tekan Tombol Untuk Memilih'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
    // var scaffoldStat = Scaffold.of(context);
    // scaffoldStat.removeCurrentSnackBar();
    // scaffoldStat.showSnackBar(SnackBar(content: Text("$result"),));
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result"),));
  }
}

class RequestDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengembalian Data Apps'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: SelectionButton(),),
    );
  }
}


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silahkan Pilih'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  //close the screen and return "Yep!" as the result
                  Navigator.pop(context,'Anda Memilih Yes!');
                },
                child: Text("Yes!"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  //close the screen and return "Nope!" as the result
                  Navigator.pop(context,'Anda Memilih No!');
                },
                child: Text("No!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
