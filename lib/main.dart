import 'package:flutter/material.dart';
import 'package:test_project/app.dart';
import 'package:test_project/core/Dependency/dependency_injections.dart';

void main() {
  setupDI();
  runApp(
    const MyApp(),
  );
}
