import 'package:flutter/material.dart';
import 'package:flutter_app/pages/music/music_view_page.dart';
import 'package:flutter_app/widgets/common_scaffold.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      context: context,
      showBackArrow: false,
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 15,bottom: 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: double.infinity,
                child: FlatButton(
                  child: const Text('MUSIC VIEW', semanticsLabel: 'FLAT BUTTON 1'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new MusicViewPage()));
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}