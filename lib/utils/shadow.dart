import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Colors.black26, 
    offset: Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 1,
  );

  static const BoxShadow lightShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0.5,
  );

  static const BoxShadow strongShadow = BoxShadow(
    color: Colors.black38,
    offset: Offset(0, 6),
    blurRadius: 12,
    spreadRadius: 2,
  );
}
