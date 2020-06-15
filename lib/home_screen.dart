import 'package:flutter/material.dart';
import 'package:netflixcopyapp/constants.dart';
import 'package:netflixcopyapp/home_page.dart';
import 'package:netflixcopyapp/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  List get pages {
    var _pages = [
      HomePage(),
      SearchPage(),
      Text('Coming Soon'),
      Text('Download'),
      Text('More'),
    ];
    return _pages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: kNavBarTextColor,
        selectedLabelStyle: TextStyle(
          fontSize: kNavBarTextSize,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: kNavBarTextSize,
        ),
        selectedIconTheme: IconThemeData(
          size: kNavBarIconSize,
        ),
        unselectedIconTheme: IconThemeData(
          size: kNavBarIconSize,
        ),
        backgroundColor: Colors.grey[900],
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'Search',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library,
            ),
            title: Text(
              'Coming Soon',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_download,
            ),
            title: Text(
              'Downloads',
              style: TextStyle(
                color: kNavBarTextColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            title: Text(
              'More',
            ),
          ),
        ],
      ),
    );
  }
}
