import 'package:flutter/material.dart';

import '../model/RadioResponse.dart';

class RadioItem extends StatelessWidget {
  Radios radios;
  Function play;
  Function pause;

  RadioItem(this.radios, this.play, this.pause);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          radios.name ?? "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  play(radios.radioUrl);
                },
                icon: Icon(Icons.play_arrow)),
            IconButton(
                onPressed: () {
                  pause();
                },
                icon: Icon(Icons.pause))
          ],
        )
      ],
    );
  }
}
