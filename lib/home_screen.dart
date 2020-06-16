import 'package:flutter/material.dart';
import 'package:netflixcopyapp/coming_soon_page.dart';
import 'package:netflixcopyapp/downloads_page.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';
import 'package:netflixcopyapp/home_page.dart';
import 'package:netflixcopyapp/more_page.dart';
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
      ComingSoonPage(),
      DownloadsPage(),
      MorePage(),
    ];
    return _pages;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: pages[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontSize: SizeConfig.textSizeSmall,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: SizeConfig.textSizeSmall,
        ),
        selectedIconTheme: IconThemeData(
          size: 25.0,
        ),
        unselectedIconTheme: IconThemeData(
          size: 25.0,
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
