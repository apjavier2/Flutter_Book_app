import 'dart:convert';
import 'package:bookinfo_app/widgets/bookCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class bookGenres extends StatefulWidget {
  const bookGenres({Key? key}) : super(key: key);

  @override
  _bookGenresState createState() => _bookGenresState();
}

class _bookGenresState extends State<bookGenres> {
  List books = [];
  List genres = ['Action', 'Romance', 'Horror', 'Crime', 'Drama', 'History', 'Fiction', 'Education', 'Humor'];
  int chosenGenre = 0;
  int totalItems = 0;

  Future<bool> loadData() async{
    Response books_response = await get(Uri.parse('${dotenv.env['base_url']}/volumes?q=subject:${genres[chosenGenre]}'), headers: {"Content-Type": "application/json"});
    if(books_response.body.isNotEmpty){
      Map books_data = jsonDecode(books_response.body);
      books = books_data['items'];
      totalItems = books_data['totalItems'];
      return true;
    }
    return false;
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(5,0,5,5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: genres.map((item) => InkWell(
                onTap: (){
                  setState(() {
                    chosenGenre = genres.indexOf(item);
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: genres.indexOf(item) == chosenGenre? textTheme(item, 30, Colors.blueAccent, '', []) : textTheme(item, 30, Colors.white, '', [])
                ),
              )).toList(),
            ),
          ),
          FutureBuilder(
              future: loadData(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return(
                      Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(color: Colors.white),
                            height: 30.0,
                            width: 30.0,
                          )
                      ));
                }
                if(snapshot.hasData && snapshot.data == false){
                  return (textTheme('Error Occurred, try again!', 15, Colors.white, 'PoppinsRegular', []));
                }
                return(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: books.map((item) =>bookCard(item)).toList(),
                    )
                );
              }
          )

        ],
      ),
    );
  }
}
