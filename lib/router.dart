import 'package:bookinfo_app/pages/bookInfo.dart';
import 'package:bookinfo_app/pages/searchResults.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case '/home':
      return MaterialPageRoute(builder: (context) => home());
    case '/bookInfo':
      var data = settings.arguments as List;
      return MaterialPageRoute(builder: (context) => bookInfo(data[0]));
    case '/searchResults':
      var data = settings.arguments as List;
      return MaterialPageRoute(builder: (context) => searchResults(data[0], data[1]));
    default:
      return MaterialPageRoute(builder: (context) => home());
  }
}