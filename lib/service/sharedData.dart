import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveObject(String key, var value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.setString(key, value);
}

saveintObject(String key, var value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.setInt(key, value);
}

getSavedObject(String key) async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  return sp.getString(key);
}



getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var token = prefs.getString('token')!;

  return token;
}

String sname ="9207007175";


