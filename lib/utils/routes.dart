import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRouteBase{
  myRouteFn(context,widget){
    return Navigator.push(context, MaterialPageRoute(builder: (_){
      return widget;}));
  }
}