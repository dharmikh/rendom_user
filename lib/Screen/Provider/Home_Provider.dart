import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rendom_user/Screen/Model/HomeModel.dart';

class HomeProvider extends ChangeNotifier {

  HomeModel? data;
  void Refresh(Data) {
    data = Data;
    notifyListeners();
  }
}
