import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textTheme.dart';


class featuredBook extends StatelessWidget {
  Map bookData = {};

  Future<bool> loadData() async{
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return(
                  Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(color: Colors.white),
                        height: 50.0,
                        width: 50.0,
                      )
                  ));
            }
            if(snapshot.hasData && snapshot.data == false){
              return (textTheme('Error Occurred, try again!', 15, Colors.white, 'PoppinsRegular', []));
            }
            return(
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: textTheme('', 15, Colors.white, 'PoppinsRegular', []),
                    )
                )
            );
          }
      ),
    );
  }
}
