import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutube/flutube.dart';



class Tutorial extends StatefulWidget {
  @override
  TutorialState createState() => TutorialState();
}

class TutorialState extends State<Tutorial> {
  final List<String> playlist = <String>[
    'https://www.youtube.com/watch?v=CTW0_s8YPOA',
    
  ];
  final List<String> playlist1 = <String>[

    'https://www.youtube.com/watch?v=FyOzeO6fQwI',
  ];
  int currentPos;
  String stateText;

  @override
  void initState() {
    currentPos = 0;
    stateText = "Video not started";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluTube Test'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text("Profitable Crops",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              Container(
                child:FluTube.playlist(
                  playlist,
                  autoInitialize: true,
                  aspectRatio: 16 / 9,
                  allowMuting: false,
                  looping: true,
                  deviceOrientationAfterFullscreen: [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ],
                  systemOverlaysAfterFullscreen: SystemUiOverlay.values,
                  onVideoStart: () {
                    setState(() {
                      stateText = 'Video started playing!';
                    });
                  },
                  onVideoEnd: () {
                    setState(() {
                      stateText = 'Video ended playing!';
                    });
                  },
                )
              ),
              Text("Ways To earn More",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Container(
                margin: EdgeInsets.all(5.0),
                child: FluTube.playlist(
                  playlist1,
                  autoInitialize: true,
                  aspectRatio: 16 / 9,
                  allowMuting: false,
                  looping: true,
                  deviceOrientationAfterFullscreen: [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ],
                  systemOverlaysAfterFullscreen: SystemUiOverlay.values,
                  onVideoStart: () {
                    setState(() {
                      stateText = 'Video started playing!';
                    });
                  },
                  onVideoEnd: () {
                    setState(() {
                      stateText = 'Video ended playing!';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}