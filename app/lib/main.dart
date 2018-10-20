import 'package:app/service/device/session_service.dart';
import 'package:app/ui/home.dart';
import 'package:app/ui/login.dart';
import 'package:flutter/material.dart';

void main() async {
  var email = await getEmail();
  var isLoggedIn = email != null;

  runApp(MaterialApp(
    title: 'ACME',
    theme: ThemeData.light(),
    initialRoute: '/',
    routes: {
      '/': (context) => isLoggedIn ? Home() : Login(),
      '/login': (context) => Login(),
      '/home': (context) => Home()
    },
  ));
}
