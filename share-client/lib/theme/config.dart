import 'package:flutter/material.dart';


/// @Description 全局配置类
class Config {
  /// 主题颜色
  static const int _primaryColorValue = 0xFF5055C2;
  static const Color primaryColor = Color(_primaryColorValue);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFC0C1F5),
      100: Color(0xFFC0C1F5),
      200: Color(0xFF958EC3),
      300: Color(0xFF9094E7),
      400: Color(_primaryColorValue),
      500: Color(0xFF4B51C4),
      600: Color(0xFF2D34B0),
    },
  );
}
