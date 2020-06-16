import 'package:flutter/material.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';

class PreviewsRowWidget extends StatefulWidget {
  const PreviewsRowWidget();

  @override
  _PreviewsRowWidgetState createState() => _PreviewsRowWidgetState();
}

class _PreviewsRowWidgetState extends State<PreviewsRowWidget> {
  bool _hasMore = true;

  List<String> _previewsList = [
    'King Khan',
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
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Previews',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textSizeMainHeading,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: SizeConfig.smallDevice ? 100 : 130,
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
                      left: 20.0,
                      top: 10.0,
                      right: 10.0,
                    ),
                    child: SinglePreviewWidget(title: _previewsList[index]),
                  );
                }

                if (index == _previewsList.length) {
                  if (_hasMore) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
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
                    top: 10.0,
                    right: 10.0,
                  ),
                  child: SinglePreviewWidget(title: _previewsList[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SinglePreviewWidget extends StatefulWidget {
  final String title;
  const SinglePreviewWidget({
    @required this.title,
  });

  @override
  _SinglePreviewWidgetState createState() => _SinglePreviewWidgetState();
}

class _SinglePreviewWidgetState extends State<SinglePreviewWidget> {
  Image _image;

  @override
  void initState() {
    _image = Image.network(
      'https://i.pinimg.com/originals/bd/02/4a/bd024a2724fbd9bd8f9b9e83488a0bb1.jpg',
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
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: SizeConfig.smallDevice ? 40 : 50,
          backgroundImage: _image.image,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.smallDevice
                  ? SizeConfig.textSizeSubHeading
                  : SizeConfig.textSizeLarge,
            ),
          ),
        )
      ],
    );
  }
}
