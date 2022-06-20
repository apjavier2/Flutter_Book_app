import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';

class categoriesDisplay extends StatelessWidget {
  List categories;
  categoriesDisplay(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: textTheme('Genres', 20, Colors.white, '', ['B'])
          ),
          categories.isEmpty? textTheme('None Listed', 15, Colors.white, '', []):
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(5,0,5,5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map<Widget>((item) => Container(
                height: MediaQuery.of(context).size.height* .06,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textTheme(categories.indexOf(item) != (categories.length-1) ? "$item |" : "$item", 15, Colors.white, '', []),
                )),
              )).toList(),
            ),
          )

        ],
      ),
    );
  }
}
