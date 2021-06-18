import 'package:climate_teller/services/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper({required this.url});
  final String url;

  @override
  Future getdata() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }
}
