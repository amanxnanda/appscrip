// import 'package:flutter/material.dart';
// import 'package:volume/volume.dart';

// class VolumeBar extends StatefulWidget {
//   VolumeBar({Key? key}) : super(key: key);

//   @override
//   _VolumeBarState createState() => _VolumeBarState();
// }

// class _VolumeBarState extends State<VolumeBar> {
//   late AudioManager audioManager;
//   late int maxVol, currentVol;

//   ShowVolumeUI showVolumeUI = ShowVolumeUI.HIDE;

//   @override
//   void initState() {
//     // TODO: implement initState
//     audioManager = AudioManager.STREAM_MUSIC;
//     initAudioStreamType();
//     updateVolumes();
//     super.initState();
//   }

//   Future<void> initAudioStreamType() async {
//     await Volume.controlVolume(AudioManager.STREAM_MUSIC);
//   }

//   updateVolumes() async {
//     // get Max Volume
//     maxVol = await Volume.getMaxVol;
//     // get Current Volume
//     currentVol = await Volume.getVol;
//     setState(() {});
//   }

//   setVol(int i) async {
//     await Volume.setVol(i);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//       value: currentVol / 1.0,
//       onChanged: (double d) {
//         setVol(d.toInt());
//         updateVolumes();
//       },
//       divisions: maxVol,
//       max: maxVol / 1.0,
//       min: 0,
//     );
//   }
// }
