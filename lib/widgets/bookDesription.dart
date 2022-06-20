import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';



class bookDescription extends StatefulWidget {
  String description;
  bookDescription(this.description);

  @override
  _bookDescriptionState createState() => _bookDescriptionState();
}

class _bookDescriptionState extends State<bookDescription> {
  bool viewMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textTheme(widget.description.length < 200 || viewMore? widget.description :widget.description.substring(0,200)+"..."   ,18, Colors.white, '', []),
        widget.description.length > 200?
        Align(
          alignment:  FractionalOffset.bottomRight,
          child: InkWell(
            onTap: (){
              setState(() {
                viewMore = !viewMore;
              });
            },
            child: textTheme( viewMore? 'See Less' : 'See More', 15, Colors.white ,"", ['B'])
          ),
        ): SizedBox(height: 0)
      ],
    );
  }
}
