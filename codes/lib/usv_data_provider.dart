import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class USVData {
  final double battery;
  final double speed;
  final double pH;
  final double DO;
  final double COD;
  final double TSS;

  const USVData({
    required this.battery,
    required this.speed,
    required this.pH,
    required this.DO,
    required this.COD,
    required this.TSS,
  });
}

class USVDataProvider extends InheritedWidget {
  final USVData data;

  const USVDataProvider({super.key, required this.data, required Widget child})
    : super(child: child);

  // 🔍 Cách widget con truy cập vào dữ liệu:
  static USVData of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<USVDataProvider>();
    assert(widget != null, 'USVDataProvider not found in context');
    return widget!.data;
  }

  // 🔁 Khi nào rebuild các widget con phụ thuộc?
  @override
  bool updateShouldNotify(USVDataProvider oldWidget) {
    return oldWidget.data != data;
  }
}
