import 'package:appscrip/videos.dart';
import 'package:appscrip/volume_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appscrip/authentication_service.dart';

import 'camera_window.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: VideoDisplay(
                  videoURL:
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
                ),
              ),
              // SizedBox(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   child: VolumeBar(),
              // ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text('Sign Out'),
              ),
              Spacer(),
            ],
          ),
          CameraWindow(
            xPos: MediaQuery.of(context).size.width - 200.0,
            yPos: MediaQuery.of(context).size.height - 300.0,
            // xPos: 50,
            // yPos: 50,
          ),
        ],
      ),
    );
  }
}
