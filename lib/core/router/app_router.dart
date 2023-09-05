import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/views/screen/character_page/character_page.dart';
import 'package:test_project/views/screen/home/home_page.dart';
import 'package:test_project/views/screen/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CharacterRoute.page),
      ];
}
