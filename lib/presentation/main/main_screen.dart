import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/bottom_navigation/bottom_navigation_scaffold.dart';
import 'package:filmoow/presentation/common/bottom_navigation/bottom_navigation_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          label: 'Listas',
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
          label: 'Conteúdos',
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
          label: 'Usuários',
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
        initialRouteName: RouteNameBuilder.getUserListRoute(),
      ),

      BottomNavigationTab(
        bottomNavigationBarItem: const BottomNavigationBarItem(
          label: 'Perfil',
          activeIcon: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: Colors.black,
            ),
          ),
          icon: FaIcon(
            FontAwesomeIcons.userCircle,
            color: Colors.grey,
          ),
        ),
        navigatorKey: GlobalKey<NavigatorState>(),
        initialRouteName: RouteNameBuilder.getProfileRoute(),
      ),

    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => BottomNavigationScaffold(
        _navigationBarItems ?? [],
      );
}
