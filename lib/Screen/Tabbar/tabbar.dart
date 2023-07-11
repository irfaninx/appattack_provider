import 'package:appattack_provider/Model/selectcollegemodel.dart';
import 'package:appattack_provider/Screen/Tabbar/search_view.dart';
import 'package:appattack_provider/Screen/Tabbar/setting_view.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:appattack_provider/Widget/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';
import 'nearby_view.dart';
import 'notification_view.dart';

class tabbar extends StatefulWidget {
  const tabbar({super.key, required this.objcollege});
  final CollegeData? objcollege;
  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  final List<Widget> _widgetOptions = <Widget>[
    const home_view(),
    const search_view(),
    const nearby_view(),
    const notification_view(),
    const setting_view(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: buildNavigator(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstants.primary,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _widgetOptions.elementAt(_selectedIndex));
      },
    );
  }
}
