import 'dart:convert';
import 'package:bookinfo_app/widgets/bookGenres.dart';
import 'package:bookinfo_app/widgets/featuredBook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../widgets/textTheme.dart';

//Page information: This page shows the books in different genres and also has a search bar where users can input book keywords

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {
  final searchController = TextEditingController();
  List searchData = [];

  Future<List> searchBooks() async{
    Response books_response = await get(Uri.parse('${dotenv.env['base_url']}/volumes?q=${searchController.text}'), headers: {"Content-Type": "application/json"});
    if(books_response.body.isNotEmpty){
      Map books_data = jsonDecode(books_response.body);
      print(books_data['items']);
      return(books_data['items']);
    }
    return([]);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Align(
                alignment: FractionalOffset.center,
                child: Container(
                    padding: EdgeInsets.fromLTRB(20,50,0,5),
                    child: Row(
                      children: [
                        Icon(Icons.menu_book_rounded, color: Colors.white, size: MediaQuery.of(context).size.width *.09),
                        textTheme(' GoBooks', 60, Colors.blue, 'PoppinsRegular', ['']),
                      ],
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20,5,10,5),
                child: TextField(
                  style: TextStyle(
                      height: MediaQuery.of(context).size.height *.0015
                  ),
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    // prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () async{
                        List books = await searchBooks();
                        Navigator.pushNamed(context, '/searchResults', arguments: [searchController.text,books]);
                      },
                    ),
                    hintText: 'Search for books',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              //featuredBook(),
              bookGenres()
            ],
          ),
        ),
      ),
    );
  }
}
