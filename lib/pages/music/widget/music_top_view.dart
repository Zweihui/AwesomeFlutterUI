import 'package:flutter/material.dart';
import 'package:flutter_app/pages/music/model/music.dart';
import 'package:flutter_app/pages/music/widget/triangle_clipper.dart';

class MusicTopView extends StatefulWidget {
  final List<Music> musics;
  final int position;

  const MusicTopView({Key key, @required this.musics,@required this.position,}) : super(key: key);


  @override
  MusicTopViewState createState() => new MusicTopViewState();
}

class MusicTopViewState extends State<MusicTopView> {

  List<Widget> renderRow() {
    int i = 0;
    return widget.musics.map((music) {
      Widget widget = renderRowItem(music.imagePath, i);
      i++;
      return widget;
    }).toList();
  }

  Widget renderRowItem(String imagePath, int position) {
    if (position == 0) {
      return ClipOval(
        child: Image.asset(
          imagePath,
          height: 30,
          width: 30,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: renderRow(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ClipPath(
            clipper: TriangleClipper(TriangleDirection.up),
            child: Container(
              width: 12,
              height: 6,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          height: 0.2,
          width: 268.0,
          color: Colors.black87,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            widget.musics[widget.position].singer,
            style: TextStyle(
              color: Color(0xFFEB6664),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            widget.musics[widget.position].name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }

}