import 'package:flutter/material.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';

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
      fit: BoxFit.cover,
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