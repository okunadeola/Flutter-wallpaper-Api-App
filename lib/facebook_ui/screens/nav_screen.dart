import 'package:flutter/material.dart';
import 'package:newapp/facebook_ui/data/data.dart';
import 'package:newapp/facebook_ui/screens/home_screen.dart';
import 'package:newapp/facebook_ui/widgets/widgets.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.supervisor_account_rounded,
    Icons.notifications,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  child: CustomAppBar(
                      currentUser: currentUser,
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)),
                  preferredSize: Size(screenSize.width, 100.0),
                )
              : null,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          // TabBarView(
          //   // physics: NeverScrollableScrollPhysics(),
          //   children: _screens,
          // ),
          // body: _screens[_selectedIndex],

          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)),
                )
              : const SizedBox.shrink()),
    );
  }
}
