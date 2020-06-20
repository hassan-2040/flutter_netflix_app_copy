import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';
import 'package:netflixcopyapp/widgets/bottom_sheet_widget.dart';
import 'package:netflixcopyapp/widgets/single_listing_widget.dart';

class ContinueWatchingRowWidget extends StatefulWidget {
  final String imageUrl;
  const ContinueWatchingRowWidget({
    @required this.imageUrl,
  });

  @override
  _ContinueWatchingRowWidgetState createState() =>
      _ContinueWatchingRowWidgetState();
}

class _ContinueWatchingRowWidgetState extends State<ContinueWatchingRowWidget> {
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
            'Continue Watching for Hassan',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textSizeMainHeading,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250,
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
                      right: 8.0,
                    ),
                    child: ContinueWatchingSingleListingWidget(
                      imageUrl: widget.imageUrl,
                    ),
                  );
                }

                if (index == _previewsList.length) {
                  if (_hasMore) {
                    return Container(
                      width: 200,
                      height: 125,
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
                    right: 8.0,
                  ),
                  child: ContinueWatchingSingleListingWidget(
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

class ContinueWatchingSingleListingWidget extends StatelessWidget {
  final String imageUrl;
  ContinueWatchingSingleListingWidget({
    @required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SingleListingWidget(
              height: 200,
              width: 125,
              imageUrl: imageUrl,
            ),
            Positioned(
              right: 0,
              left: 50,
              bottom: 0,
              child: Text(
                'S2:E9',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: SizeConfig.textSizeSmall,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.play_circle_outline,
                color: Theme.of(context).primaryColor,
                size: 60,
              ),
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 2,
              width: 125,
              color: Colors.grey[900],
            ),
            Container(
              height: 2,
              width: 125 / 3,
              color: Colors.red,
            ),
          ],
        ),
        Container(
          color: Colors.grey[900],
          width: 125,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
              ),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  useRootNavigator: true,
                  context: context,
                  builder: (ctx) => const BottomSheetWidget(),
                ),
                child: Icon(
                  LineAwesomeIcons.ellipsis_v,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
