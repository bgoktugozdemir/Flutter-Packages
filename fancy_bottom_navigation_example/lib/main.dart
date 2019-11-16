import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Color _appBarColor = Colors.black;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fancy Bottom Navigation"),
        backgroundColor: _appBarColor,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          _pageItem("Home"),
          _pageItem("Apps"),
          _pageItem("Messages"),
          _pageItem("Search"),
        ],
        // This method changes currentTab when page is changed.
        onPageChanged: (index) => setState(() {
          _currentTab = index;
        }),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        // The parameters of 'onTabChangedListener' and 'tabs' are required.
        onTabChangedListener: (index) => setState(() {
          _currentTab = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        tabs: [
          // 1 < Tabs Length < 5
          TabData(
            // The parameters of 'title' and 'iconData' are required.
            title: "Home",
            iconData: Icons.home,
          ),
          TabData(
            // The parameters of 'title' and 'iconData' are required.
            title: "Apps",
            iconData: Icons.apps,
          ),
          TabData(
            // The parameters of 'title' and 'iconData' are required.
            title: "Messages",
            iconData: Icons.message,
          ),
          TabData(
            // The parameters of 'title' and 'iconData' are required.
            title: "Search",
            iconData: Icons.search,
          ),
        ],
        initialSelection: _currentTab, // Initial Selection (Default: 0)
        activeIconColor: Colors.white, // Active Icon Color
        circleColor: _appBarColor, // Circle Color
        inactiveIconColor: _appBarColor, // Inactive Icon Color
        textColor: _appBarColor, // Text Color
      ),
    );
  }
}

Widget _pageItem(String pageName) {
  return Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '@bgoktugozdemir',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(pageName),
        ],
      ),
    ),
  );
}
