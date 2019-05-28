import 'package:flutter/material.dart';
import 'package:flutter_app/pages/music/model/music.dart';
import 'package:flutter_app/pages/music/widget/music_bottom_view.dart';
import 'package:flutter_app/pages/music/widget/music_top_view.dart';
import 'package:flutter_app/widgets/common_scaffold.dart';

class MusicViewPage extends StatefulWidget {
  @override
  MusicViewPageState createState() => new MusicViewPageState();
}

class MusicViewPageState extends State<MusicViewPage> {
  int currentPosition = 3;

  List<Music> musics = [
    Music('哎呦, 不錯哦', 'Jay Chou', 'static/images/music/1.jpg'),
    Music('紅塵客棧', 'Jay Chou', 'static/images/music/2.jpg'),
    Music('七里香', 'Jay Chou', 'static/images/music/3.jpg'),
    Music('床邊故事', 'Jay Chou', 'static/images/music/4.jpg'),
    Music('龍卷風', 'Jay Chou', 'static/images/music/5.jpg'),
    Music('四季快車', 'Jay Chou', 'static/images/music/6.jpg'),
    Music('天地一鬥', 'Jay Chou', 'static/images/music/7.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return new CommonScaffold(
      title: 'PLAYLIST',
      context: context,
      showBackArrow: false,
      body: Container(
        color: Colors.white,
        child:Column(
          children: <Widget>[
            MusicTopView(musics: musics,position: currentPosition,),
          ],
        )
      ),
      bottomNavigationBar: MusicBottomView(
        listener: onBottomClick,
      ),
    );
  }

  void onBottomClick(bool isPlaying) {}

}
