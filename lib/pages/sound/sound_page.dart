import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_web_admin/constant/controller.dart';
import 'package:flutter_web_admin/helpers/responsiveness.dart';
import 'package:flutter_web_admin/pages/clients/widgets/clients_table.dart';
import 'package:flutter_web_admin/widgets/custom_text.dart';

import 'package:get/get.dart';

const listAssetsSoundPath = [
  'assets/sound/do.wav',
  'assets/sound/re.wav',
  'assets/sound/mi.wav',
  'assets/sound/fa.wav',
  'assets/sound/sol.wav',
  'assets/sound/la.wav',
  'assets/sound/si.wav',
  'assets/sound/do-octave.wav',
];

const listSoundName = [
  'Do',
  'Re',
  'Mi',
  'Fa',
  'Sol',
  'La',
  'Si',
  'Do-octave',
];

class SoundsPage extends StatefulWidget {
  const SoundsPage({Key? key}) : super(key: key);

  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  FlutterSoundPlayer _player = FlutterSoundPlayer();
  late Future<bool> loadSound;
  List<Uint8List> listDataSound = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.openAudioSession();
    loadSound = loadListSound();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.closeAudioSession();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<bool>(
              future: loadSound,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data! == true) {
                  return ListView.builder(
                    itemCount: listDataSound.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () async {
                          _player.startPlayer(
                              fromDataBuffer: listDataSound[index],
                              codec: Codec.pcm16WAV);
                        },
                        child: CustomText(
                          text: listSoundName[index],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> loadListSound() async {
    for (String path in listAssetsSoundPath) {
      listDataSound.add((await rootBundle.load(path)).buffer.asUint8List());
    }
    return true;
  }
}
