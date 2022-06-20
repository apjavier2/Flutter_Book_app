import 'dart:convert';

import 'package:bookinfo_app/widgets/bookPoster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class similarBooks extends StatelessWidget {
  String similar;
  List similarbooks = [];
  similarBooks(this.similar);

  Future<bool> loadData() async{
    Response books_response = await get(Uri.parse('${dotenv.env['base_url']}/volumes?q=${similar}'), headers: {"Content-Type": "application/json"});
    if(books_response.body.isNotEmpty){
      Map books_data = jsonDecode(books_response.body);
      similarbooks = books_data['items'];
      return true;
    }

    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTheme('Similar Books', 20, Colors.white, '', ['B']),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(5,0,5,5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: similarbooks.map((item) =>bookPoster(item)).toList(),
                      ),
                    )
                );
              }
          )
        ],
      ),
    );
  }
}
