import 'package:bookinfo_app/widgets/textTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/bookCard.dart';

//Page information: This shows the search results of the search book query

class searchResults extends StatelessWidget {
  List books;
  String query;
  searchResults(this.query,this.books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 40, 5, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: FractionalOffset.topLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0,0, 0, 10),
                  child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 20)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                width: MediaQuery.of(context).size.width* .8,
                child: textTheme('Search Results for: ${query}', 25, Colors.white, '', ['B'])
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: books.map<Widget>((item) =>bookCard(item)).toList(),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
