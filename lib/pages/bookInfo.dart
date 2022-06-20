import 'package:bookinfo_app/widgets/bookDesription.dart';
import 'package:bookinfo_app/widgets/categoriesDisplay.dart';
import 'package:bookinfo_app/widgets/similarBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';

//Page information: This shows more details about the book and similar books

class bookInfo extends StatelessWidget {
  //The book data was passed instead of calling the get by id api since both have almost the same data provided.
  Map book;
  bookInfo(this.book);

  bool viewDescript = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10,40,5,5),
          width: double.infinity,
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
              Align(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5,10,5,5) ,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: book['volumeInfo']['imageLinks']!= null ? Image.network(
                         book['volumeInfo']['imageLinks']['thumbnail'],
                        fit: BoxFit.fill,
                      ):
                      Image.asset(
                        'assets/defaultCover.png',
                        fit: BoxFit.fill,
                      ),
                    )
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  width: MediaQuery.of(context).size.width * .7,
                  child: textTheme(book['volumeInfo']['title'] ,30, Colors.white, '', ['B'])
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                  width: MediaQuery.of(context).size.width * .7,
                  child: textTheme( book['volumeInfo']['authors']!= null? book['volumeInfo']['authors'][0] : "No authors available." ,18, Colors.white, '', [])
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                  width: MediaQuery.of(context).size.width * .9,
                  //child: textTheme( book['volumeInfo']['description']!= null? book['volumeInfo']['description'] : "Description Unavailable" ,18, Colors.white, '', [])
                  child: book['volumeInfo']['description']!= null? bookDescription(book['volumeInfo']['description']) : textTheme( "Description Unavailable" ,18, Colors.white, '', [])
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: categoriesDisplay(book['volumeInfo']['categories'] != null? book['volumeInfo']['categories'] : [] )
                )
              ),
              book['volumeInfo']['categories'] != null?
              similarBooks(book['volumeInfo']['categories'][0]) : SizedBox(height: 0)
            ],
          ),
        ),
      ),
    );
  }
}
