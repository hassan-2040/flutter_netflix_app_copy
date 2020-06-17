import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';
import 'package:netflixcopyapp/widgets/featured_listing_widget.dart';
import 'package:netflixcopyapp/widgets/listings_row_widget.dart';
import 'package:netflixcopyapp/widgets/previews_row_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _appBarColorOpacity = 0.0;

  AnimationController _slideController;
  Animation<Offset> _slideValue;

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideValue = Tween(begin: Offset.zero, end: Offset(0.0, -1.0)).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _slideValue.addListener(() {
      setState(() {});
    });
//    WidgetsBinding.instance
//        .addPostFrameCallback((_) => setState((){_isInitState = false;}));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    //making sure opacity value remains b/w 0 and 1
    double _tempOpacityValue;
    final _relativeValue = _scrollController.offset / 300;
    if (_relativeValue < 0) {
      _tempOpacityValue = 0;
    } else if (_relativeValue < 1) {
      _tempOpacityValue = _relativeValue;
    } else {
      _tempOpacityValue = 1;
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _slideController.reverse();
      });
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _slideController.forward();
      });
    }
    //changing opacity value based on scroll position
    setState(() {
      _appBarColorOpacity = _tempOpacityValue;
    });

//    if (_scrollController.offset >=
//        _scrollController.position.maxScrollExtent &&
//        !_scrollController.position.outOfRange) {
//      setState(() {
//        _allowGestureScrollTabView = true;
//      });
    //reached the bottom
//    }

//    if (_scrollController.offset <=
//        _scrollController.position.minScrollExtent &&
//        !_scrollController.position.outOfRange) {
//      setState(() {
//        _allowGestureScrollTabView = false;
//      });
    //reached the top
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                const FeaturedListingWidget(),
                SizedBox(
                  height: 30,
                ),
                const PreviewsRowWidget(),
                SizedBox(
                  height: 30,
                ),
                const ListingsRowWidget(
                  rowTitle: 'My List',
                  listingHeight: 200,
                  listingWidth: 125,
                  imageUrl: 'http://www.freemovieposters.net/posters/pulp_fiction_1994_6115_poster.jpg',
                ),
                SizedBox(
                  height: 30,
                ),
                const ListingsRowWidget(
                  rowTitle: 'Quirky Sitcoms',
                  listingHeight: 200,
                  listingWidth: 125,
                  imageUrl: 'http://www.freemovieposters.net/posters/resident_evi_2002_6129_poster.jpg',
                ),
                SizedBox(
                  height: 30,
                ),
                const ListingsRowWidget(
                  rowTitle: 'Trending Now',
                  listingHeight: 200,
                  listingWidth: 125,
                  imageUrl: 'http://www.freemovieposters.net/posters/titanic_1997_6121_poster.jpg',
                ),
                SizedBox(
                  height: 30,
                ),
                const ListingsRowWidget(
                  rowTitle: 'Netflix Originals',
                  listingHeight: 300,
                  listingWidth: 200,
                  imageUrl: 'http://www.freemovieposters.net/posters/mission_impossible_1996_6130_poster.jpg',
                ),
              ],
            ),
          ),
          SlideTransition(
            position: _slideValue,
            child: Container(
              color: Colors.black.withOpacity(_appBarColorOpacity),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.movie_filter,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                    Text(
                      'TV Show',
                      style: TextStyle(
                        fontSize: SizeConfig.textSizeLarge,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Movies',
                      style: TextStyle(
                        fontSize: SizeConfig.textSizeLarge,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'My List',
                      style: TextStyle(
                        fontSize: SizeConfig.textSizeLarge,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//CustomScrollView(
//slivers: <Widget>[
//SliverAppBar(
//backgroundColor: Colors.transparent,
//elevation: 0,
//floating: true,
//pinned: false,
//snap: true,
//primary: true,
//forceElevated: false,
//automaticallyImplyLeading: false,
//expandedHeight: 300,
//flexibleSpace: FlexibleSpaceBar(
//collapseMode: CollapseMode.pin,
//background: Image.network(
//'https://volganga.com/wordpress/wp-content/uploads/2015/07/pixels_2015_movie_hd_wallpapers_01.jpg',
//fit: BoxFit.cover,
//frameBuilder: (
//BuildContext context,
//    Widget image,
//int frame,
//    bool wasSynchronouslyLoaded,
//) {
//return AnimatedOpacity(
//child: image,
//opacity: frame == null ? 0 : 1,
//duration: const Duration(seconds: 1),
//curve: Curves.easeIn,
//);
//},
//loadingBuilder: (
//BuildContext context,
//    Widget image,
//ImageChunkEvent loadingProgress,
//) {
//if (loadingProgress == null) return image;
//if (loadingProgress != null &&
//loadingProgress.cumulativeBytesLoaded <
//loadingProgress.expectedTotalBytes) {
//return CircularProgressIndicator();
//} else if (loadingProgress.cumulativeBytesLoaded ==
//loadingProgress.expectedTotalBytes) {
//return image;
//}
//return image;
//},
//errorBuilder: (BuildContext context, Object exception,
//StackTrace stackTrace) {
//return Center(
//child: Text(
//'Could not load image',
//textAlign: TextAlign.center,
//style: TextStyle(
//fontSize: 8,
//),
//),
//);
//},
//),
//),
//leading: Padding(
//padding: const EdgeInsets.only(left: 30.0),
//child: Icon(
//Icons.movie_filter,
//size: 30,
//color: Theme.of(context).primaryColor,
//),
//),
//title: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Text(
//'TV Show',
//style: TextStyle(
//fontSize: 16,
//color: Theme.of(context).primaryColor,
//fontWeight: FontWeight.normal,
//),
//),
//Text(
//'Movies',
//style: TextStyle(
//fontSize: 16,
//color: Theme.of(context).primaryColor,
//fontWeight: FontWeight.normal,
//),
//),
//Text(
//'My List',
//style: TextStyle(
//fontSize: 16,
//color: Theme.of(context).primaryColor,
//fontWeight: FontWeight.normal,
//),
//),
//],
//),
//),
//SliverToBoxAdapter(
//child: Container(
//width: double.maxFinite,
//child: Image.network(
//'https://volganga.com/wordpress/wp-content/uploads/2015/07/pixels_2015_movie_hd_wallpapers_01.jpg',
//fit: BoxFit.cover,
//frameBuilder: (
//BuildContext context,
//    Widget image,
//int frame,
//    bool wasSynchronouslyLoaded,
//) {
//return AnimatedOpacity(
//child: image,
//opacity: frame == null ? 0 : 1,
//duration: const Duration(seconds: 1),
//curve: Curves.easeIn,
//);
//},
//loadingBuilder: (
//BuildContext context,
//    Widget image,
//ImageChunkEvent loadingProgress,
//) {
//if (loadingProgress == null) return image;
//if (loadingProgress != null &&
//loadingProgress.cumulativeBytesLoaded <
//loadingProgress.expectedTotalBytes) {
//return CircularProgressIndicator();
//} else if (loadingProgress.cumulativeBytesLoaded ==
//loadingProgress.expectedTotalBytes) {
//return image;
//}
//return image;
//},
//errorBuilder: (BuildContext context, Object exception,
//StackTrace stackTrace) {
//return Center(
//child: Text(
//'Could not load image',
//textAlign: TextAlign.center,
//style: TextStyle(
//fontSize: 8,
//),
//),
//);
//},
//),
//),
//),
//],
//)
