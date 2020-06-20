import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Title of the Show',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: SizeConfig.textSizeMainHeading,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    LineAwesomeIcons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          const OptionsRowWidget(
            icon: Icons.info_outline,
            optionText: 'Episodes And Info',
          ),
          SizedBox(
            height: 30,
          ),
          const OptionsRowWidget(
            icon: Icons.file_download,
            optionText: 'Download Next Episode',
          ),
          SizedBox(
            height: 30,
          ),
          const OptionsRowWidget(
            icon: LineAwesomeIcons.thumbs_o_up,
            optionText: 'Like',
          ),
          SizedBox(
            height: 30,
          ),
          const OptionsRowWidget(
            icon: LineAwesomeIcons.thumbs_o_down,
            optionText: 'Not For Me',
          ),
          SizedBox(
            height: 30,
          ),
          const OptionsRowWidget(
            icon: Icons.remove_circle_outline,
            optionText: 'Remove From Row',
          ),
        ],
      ),
    );
  }
}

class OptionsRowWidget extends StatelessWidget {
  final IconData icon;
  final String optionText;
  const OptionsRowWidget({
    @required this.icon,
    @required this.optionText,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 25,
        ),
        SizedBox(width: 20,),
        Flexible(
          child: Text(
            optionText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textSizeLarge,
            ),
          ),
        ),
      ],
    );
  }
}
