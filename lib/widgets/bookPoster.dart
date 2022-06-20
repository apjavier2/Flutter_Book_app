import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookPoster extends StatelessWidget {
  Map book;
  bookPoster(this.book);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/bookInfo', arguments: [book]);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0,5,0,15),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(5,0,5,10) ,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: book['volumeInfo']['imageLinks']!= null ?  Image.network(
                      book['volumeInfo']['imageLinks']['thumbnail'],
                      fit: BoxFit.fill,
                    ):
                    Image.asset(
                      'assets/defaultCover.png',
                      fit: BoxFit.fill,
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
