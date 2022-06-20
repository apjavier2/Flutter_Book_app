import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textTheme extends StatelessWidget {
  String string;
  double size;
  Color color;
  String font;
  List additionals;

  textTheme(this.string, this.size, this.color, this.font, this.additionals);

  double convertSize(double s){
    String newSize = "0.0"+(s.toInt()+17).toString();
    return double.parse(newSize);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      textAlign: additionals.contains('C')? TextAlign.center : TextAlign.left,
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width* convertSize(size),
          fontFamily: font,
          color: color,
          fontWeight: additionals.contains('B')? FontWeight.bold : FontWeight.normal
      ),
    );
  }
}
