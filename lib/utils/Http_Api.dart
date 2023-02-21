import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rendom_user/Screen/Model/HomeModel.dart';

class ApiHttp {
  String link = "https://randomuser.me/api/";

  Future<HomeModel?> getApi() async {
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      HomeModel  dharmik = HomeModel.fromJson(json);
      print("=================================");
      return dharmik;
    } else {
      return null;
    }
  }
}
