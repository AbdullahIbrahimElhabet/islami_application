import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_refresh/api_manegar.dart';
import 'package:islami_refresh/radio/radio_item.dart';

import '../model/RadioResponse.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  play(String url) async {
    int res = await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: FutureBuilder<RadioResponse>(
              future: ApiManegar.getRadioResposne(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            "assets/images/radio_image.png",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          )),
                      Expanded(
                          flex: 2,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              );
                            },
                            physics: PageScrollPhysics(),
                            // scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(12),
                            itemBuilder: (context, index) {
                              return RadioItem(
                                  snapshot.data!.radios![index], play, pause);
                            },
                            itemCount: snapshot.data?.radios!.length ?? 0,
                          )),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("some thing went wrong");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        )
      ],
    );
  }
}
