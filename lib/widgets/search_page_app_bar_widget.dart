import 'package:flutter/material.dart';
import 'package:netflixcopyapp/helpers/size_config.dart';

class SearchPageAppBarWidget extends StatefulWidget {
  const SearchPageAppBarWidget();
  @override
  _SearchPageAppBarWidgetState createState() => _SearchPageAppBarWidgetState();
}

class _SearchPageAppBarWidgetState extends State<SearchPageAppBarWidget> {

  bool _showClearButton = false;
  bool _textFieldHasFocus = true;

  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
     setState(() {
       _textFieldHasFocus = _searchFocusNode.hasFocus;
     });
  }

  void _changeClearButtonStatus(value) {
    if (value.isNotEmpty) {
      setState(() {
        _showClearButton = true;
      });
    } else {
      setState(() {
        _showClearButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut,
        height: _textFieldHasFocus ? 60 : 50,
        margin: EdgeInsets.symmetric(horizontal: _textFieldHasFocus ? 0 : 10),
        color: Colors.grey[900],
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                autofocus: true,
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: SizeConfig.textSizeLarge,
                ),
                onChanged: (value) => _changeClearButtonStatus(value),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search for a show, movie, genre, or something you like',
                  hintStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: SizeConfig.textSizeLarge,
                  ),
                  suffixIcon: _showClearButton
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey[500],
                          ),
                          onPressed: () {
                            _searchController.clear();
                            _changeClearButtonStatus(_searchController.text);
                          },
                        )
                      : Icon(
                          Icons.mic,
                          color: Colors.grey[500],
                        ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
