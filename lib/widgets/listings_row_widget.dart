import 'package:flutter/material.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';

class ListingsRowWidget extends StatefulWidget {
  final double listingWidth;
  final double listingHeight;
  final String rowTitle;
  final String imageUrl;
  const ListingsRowWidget({
    @required this.listingHeight,
    @required this.listingWidth,
    @required this.rowTitle,
    @required this.imageUrl,
  });

  @override
  _ListingsRowWidgetState createState() => _ListingsRowWidgetState();
}

class _ListingsRowWidgetState extends State<ListingsRowWidget> {
  bool _hasMore = true;

  List<String> _previewsList = [
    'Shield',
    'Agents of Shield',
    'Gotham',
    'batman',
    'Superman',
    'Wonderwoman',
    'The Flash',
    'Arrow',
    'Pedantic',
    'Penny Dreadful',
  ];

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.extentAfter == 0) {
        _loadMore();
      }
    }
    return false;
  }

  void _loadMore() async {
    List<String> _nextTen = [
      'King Kong',
      'Avengers',
      'Captain amercia',
      'Dunkirk',
      'Easy A',
      'Stranger Things',
      'the A Team',
      'Series of Unfortunate Events',
      'The Big Bang Theory',
      'How i met your Mother',
    ];
    List<String> _last = [
      'Kabir Singh',
      'kal ho na Ho',
      'Jump Street',
      'Linkend Park',
      'The Social Network',
    ];

    if (_previewsList.length < 11 && _previewsList.length > 0) {
      await Future.delayed(Duration(
        seconds: 2,
      ));
      setState(() {
        _previewsList.addAll(_nextTen);
      });
      return;
    }
    if (_previewsList.length < 21 && _previewsList.length > 10) {
      await Future.delayed(Duration(
        seconds: 2,
      ));
      setState(() {
        _previewsList.addAll(_last);
        _hasMore = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.rowTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textSizeMainHeading,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: widget.listingHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: _previewsList.length + 1,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
//                      top: 10.0,
                      right: 8.0,
                    ),
                    child: SingleListingWidget(
                      height: widget.listingHeight,
                      width: widget.listingWidth,
                      imageUrl: widget.imageUrl,
                    ),
                  );
                }

                if (index == _previewsList.length) {
                  if (_hasMore) {
                    return Container(
                      width: widget.listingWidth,
                      height: widget.listingHeight,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    );
                  } else {
                    return null;
                  }
                }

                if (index > _previewsList.length) {
                  return null;
                }

                return Padding(
                  padding: const EdgeInsets.only(
//                    top: 10.0,
                    right: 8.0,
                  ),
                  child: SingleListingWidget(
                    height: widget.listingHeight,
                    width: widget.listingWidth,
                    imageUrl: widget.imageUrl,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SingleListingWidget extends StatefulWidget {
  final double height;
  final double width;
  final String imageUrl;
  const SingleListingWidget({
    @required this.height,
    @required this.width,
    @required this.imageUrl,
  });

  @override
  _SingleListingWidgetState createState() => _SingleListingWidgetState();
}

class _SingleListingWidgetState extends State<SingleListingWidget> {
  Image _image;
  @override
  void initState() {
    _image = Image.network(
      widget.imageUrl,
      fit: BoxFit.contain,
      frameBuilder: (
        BuildContext context,
        Widget image,
        int frame,
        bool wasSynchronouslyLoaded,
      ) {
        return AnimatedOpacity(
          child: image,
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      },
      loadingBuilder: (
        BuildContext context,
        Widget image,
        ImageChunkEvent loadingProgress,
      ) {
        if (loadingProgress == null) return image;
        if (loadingProgress != null &&
            loadingProgress.cumulativeBytesLoaded <
                loadingProgress.expectedTotalBytes) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (loadingProgress.cumulativeBytesLoaded ==
            loadingProgress.expectedTotalBytes) {
          return image;
        }
        return image;
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Center(
          child: Text(
            '${exception.toString()}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.textSizeNormal,
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: _image,
    );
  }
}
