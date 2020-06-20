import 'package:flutter/material.dart';
import 'package:netflixcopyapp/widgets/search_page_app_bar_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            const SearchPageAppBarWidget(),
          ],
        ),
      ),
    );
  }
}
