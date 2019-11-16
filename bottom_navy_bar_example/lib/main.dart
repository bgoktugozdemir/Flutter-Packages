import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bottom Navy Bar', home: Home(), color: Colors.white,);
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // This variables for BottomNavyBar's selectedIndex.
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navy Bar'),
      ),
      body: PageView(
        controller: _pageController,
        // This method changes selectedIndex when page is changed.
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        children: <Widget>[
          _pageItem("Home"),
          _pageItem("Apps"),
          _pageItem("Messages"),
          _pageItem("Search"),
          _pageItem("Settings"),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        // The parameters of 'items' and 'onItemSelected' are required.
        items: [
          BottomNavyBarItem(
            // The parameters of 'icon' and 'title' are required.
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavyBarItem(
              // The parameters of 'icon' and 'title' are required.
              icon: Icon(Icons.apps),
              title: Text('Apps'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              // The parameters of 'icon' and 'title' are required.
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.orange),
          BottomNavyBarItem(
              // The parameters of 'icon' and 'title' are required.
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              // The parameters of 'icon' and 'title' are required.
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.grey),
        ],
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        selectedIndex: _selectedIndex, // Selected Index
        showElevation: true, // Use this to remove AppBar's elevation.
        backgroundColor: Colors.white, // Background Color
        iconSize: 30, // Icons Size (Default: 24.0)
        mainAxisAlignment: MainAxisAlignment.center, // Main Axis Alignment (Default: MainAxisAlignment.spaceBetween)
        itemCornerRadius: 20, // Item Corner Radius (Default: 50.0)
        animationDuration: Duration(seconds: 1), // Animation Duration (Default: Duration(milliseconds: 270))
      ),
    );
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
            Text(pageName)
          ],
        ),
      ),
    );
  }
}
