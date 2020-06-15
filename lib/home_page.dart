import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Home', style: Theme.of(context).textTheme.headline1,),
        Text('Home', style: Theme.of(context).textTheme.headline2,),
        Text('Home', style: Theme.of(context).textTheme.headline3,),
        Text('Home', style: Theme.of(context).textTheme.headline4,),
        Text('Home', style: Theme.of(context).textTheme.headline5,),
        Text('Home', style: Theme.of(context).textTheme.headline6,),
        Text('Home', style: Theme.of(context).textTheme.bodyText1,),
        Text('Home', style: Theme.of(context).textTheme.bodyText2,),
        Text('Home', style: Theme.of(context).textTheme.subtitle1,),
        Text('Home', style: Theme.of(context).textTheme.subtitle2,),
        Text('Home', style: Theme.of(context).textTheme.caption,),
        Text('Home', style: Theme.of(context).textTheme.button,),
        Text('Home', style: Theme.of(context).textTheme.overline,),
      ],
    );
  }
}
