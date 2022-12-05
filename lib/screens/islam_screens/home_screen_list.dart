import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenList extends StatelessWidget{
  const HomeScreenList({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData.fallback(),
    ),
    body: ListView.builder(
        itemBuilder: (context , index) => buildItemView(),
        itemCount: 20
    ),
    backgroundColor: Colors.white,
  );


  Widget buildItemView() => Container(
    margin: const EdgeInsetsDirectional.all(7),
    decoration: const BoxDecoration(
      color: Color.fromRGBO(241, 246, 251, 1) ,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.16) ,
          spreadRadius: 3,
          blurRadius: 1,
          offset: Offset(0, 3),
        ),
      ],
    ),
    height: 158,
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 8,
              end: 8 ,
              top: 10,
              bottom:4
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'APARTMENT FOR RENT' ,
                  style: TextStyle(
                    color: Color.fromRGBO(70, 83, 123, 1.0),
                    fontSize: 19,
                    fontWeight: FontWeight.bold ,
                    fontFamily: 'Cairo',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ) ,
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Price' ,
                  style: TextStyle(
                    color: Color.fromRGBO(70, 83, 123, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold ,
                    fontFamily: 'Cairo'
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ) ,
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 28,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.king_bed_rounded,
                        color: Color.fromRGBO(69, 166, 221, 1),
                        size: 31,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '2' ,
                        style: TextStyle(
                            color: Color.fromRGBO(70, 83, 123, 1.0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold ,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ) ,
                      SizedBox(width: 10),
                      Icon(
                        Icons.bathtub_rounded,
                        color: Color.fromRGBO(69, 166, 221, 1),
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '2' ,
                        style: TextStyle(
                          color: Color.fromRGBO(70, 83, 123, 1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold ,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ) ,
                      SizedBox(width: 10),
                      Icon(
                        Icons.chair_rounded,
                        color: Color.fromRGBO(69, 166, 221, 1),
                        size: 25,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '1' ,
                        style: TextStyle(
                          color: Color.fromRGBO(70, 83, 123, 1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold ,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ) ,
                    ],
                  ),
                ),
                SizedBox(height: 4,),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: Text(
                          '6TH OF OCTOBER , GIZA' ,
                          style: TextStyle(
                            color: Color.fromRGBO(70, 83, 123, 1.0),
                            fontSize: 11,
                            fontWeight: FontWeight.bold ,
                            fontFamily: 'Cairo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ) ,
                      Text(
                        '144 M' ,
                        style: TextStyle(
                          color: Color.fromRGBO(70, 83, 123, 1.0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold ,
                          fontFamily: 'Cairo',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ) ,
                    ],
                  ),
                )
              ],
            ),
          ),
        ) ,
        Container(

          color: Color.fromRGBO(241, 246, 251, 1),
          height: 156,
          width: 150,
          child: Image.asset('assets/images/logo.png')),
      ],
      
    ),
  ) ;

}