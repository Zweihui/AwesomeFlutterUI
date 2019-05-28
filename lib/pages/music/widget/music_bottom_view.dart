import 'package:flutter/material.dart';
import 'package:flutter_app/pages/music/widget/triangle_clipper.dart';

typedef void OnBottomControllerClickListener(bool isPlaying);

class MusicBottomView extends StatefulWidget {
  final OnBottomControllerClickListener listener;

  MusicBottomView({
    Key key,
    @required this.listener,
  }) : super(key: key);

  @override
  MusicBottomViewState createState() => new MusicBottomViewState();
}

class MusicBottomViewState extends State<MusicBottomView> {

  bool isPlaying = false;

  Widget renderPauseOrBegin(bool isPlaying) {
    if(isPlaying){
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 5,
            height: 16,
            color: Colors.black87,
          ),
          Container(
            width: 5,
            height: 16,
            color: Colors.black87,
            margin: EdgeInsets.only(left: 5),
          ),
        ],
      );
    }else{
      return Center(
        child: ClipPath(
          clipper: TriangleClipper(TriangleDirection.right,beginPercent: 0.2),
          child: Container(
            width: 15,
            height: 16,
            color: Colors.black87,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE34D50),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            height: 55,
            color: Colors.white,
            margin: EdgeInsets.only(top: 10),
          ),
        Positioned(
          left: 50,
          child: Column(
            children: <Widget>[
              Image.asset(
                'static/images/music/sound.png',
                height: 30,
                width: 30,
              ),
              Text('Sound',style: TextStyle(fontSize: 9),),
            ],
          ),
        ),
          Positioned(
            right: 50,
          child: Column(
            children: <Widget>[
              Image.asset(
                'static/images/music/record.png',
                height: 30,
                width: 30,
              ),
              Text('Record',style: TextStyle(fontSize: 9),),
            ],
          ),
        ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: GestureDetector(
              onTap: () {
                isPlaying = !isPlaying;
                widget.listener(isPlaying);
                setState(() {

                });
              },
              child: Center(
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDB12C),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                  ),
                  child: renderPauseOrBegin(isPlaying),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
