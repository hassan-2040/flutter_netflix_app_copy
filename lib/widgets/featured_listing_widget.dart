import 'package:flutter/material.dart';

class FeaturedListingWidget extends StatelessWidget {
  const FeaturedListingWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: Container(
            height: 450,
            width: double.maxFinite,
            color: Colors.black,
            child: Image.network(
            'https://p1.pxfuel.com/preview/413/711/821/capitanamerica-marvel-avengers-movies.jpg',
              fit: BoxFit.fitHeight,
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
                  return Center(child: CircularProgressIndicator());
                } else if (loadingProgress.cumulativeBytesLoaded ==
                    loadingProgress.expectedTotalBytes) {
                  return image;
                }
                return image;
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                return Center(
                  child: Text(
                    'Could not load image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Slick',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 8,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Suspenseful',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 8,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Exciting',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 8,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Thriller',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 8,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Drama',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RawMaterialButton(
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  FlatButton(
                    color: Color(0xfff5f5f5),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  RawMaterialButton(
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
