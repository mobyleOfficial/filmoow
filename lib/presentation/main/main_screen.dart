import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/bottom_navigation/bottom_navigation_scaffold.dart';
import 'package:filmoow/presentation/common/bottom_navigation/bottom_navigation_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  static Widget create() => const MainScreen();

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<BottomNavigationTab>? _navigationBarItems;

  @override
  void didChangeDependencies() {
    _navigationBarItems ??= [
      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'Home',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Icon(
              Icons.home_filled,
            ),
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getHomeRoute(),
      ),

      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'POKÉMON LIST',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Icon(
              Icons.home_filled,
            ),
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getListsRoute(),
      ),

      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'POKÉMON LIST',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Icon(
              Icons.home_filled,
            ),
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getContentRoute(),
      ),

      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'POKÉMON LIST',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Icon(
              Icons.home_filled,
            ),
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getNewsRoute(),
      ),

      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'POKÉMON LIST',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Icon(
              Icons.home_filled,
            ),
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getUserRoute(),
      ),

    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => BottomNavigationScaffold(
        _navigationBarItems ?? [],
      );
}
