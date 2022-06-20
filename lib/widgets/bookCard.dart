import 'package:bookinfo_app/widgets/textTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class bookCard extends StatelessWidget {
  Map book;
  bookCard(this.book);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/bookInfo', arguments: [book]);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0,10,0,15),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.blue[50],
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(5,5,5,5) ,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: textTheme( book['volumeInfo']['title'].length > 55? book['volumeInfo']['title'].substring(0,54) + "..." : book['volumeInfo']['title'] ,25, Colors.black, '', [])
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: textTheme( book['volumeInfo']['authors']!= null? book['volumeInfo']['authors'][0] : "No authors available." ,15, Colors.black, '', [])
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: textTheme( book['volumeInfo']['averageRating']!= null? 'Rating: ${book['volumeInfo']['averageRating'].toString()}': "No available ratings." ,15, Colors.black, '', [])
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
