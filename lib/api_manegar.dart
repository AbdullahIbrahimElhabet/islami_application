import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/RadioResponse.dart';

class ApiManegar {
  static const String baseurl = "api.mp3quran.net";

  static Future<RadioResponse> getRadioResposne() async {
    //  https://api.mp3quran.net/radios/radio_arabic.json
    var url = Uri.https(baseurl, "/radios/radio_arabic.json");
    var reposne = await http.get(url);
    try {
      var stringBody = reposne.bodyBytes;
      var json = jsonDecode(utf8.decode(stringBody));
      RadioResponse radioResponse = RadioResponse.fromJson(json);
      return radioResponse;
    } catch (e) {
      throw e;
    }
  }
}
