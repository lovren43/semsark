import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreenList extends StatelessWidget{
  const HomeScreenList({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        SizedBox(height: 150,),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                  itemBuilder: (context , index) => buildItemView(),
                  itemCount: 20
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(
                  bottom: 15
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildNavBar(),
                  ],
                ),
              ) ,
            ],
          ),
        ),
      ],
    ),

    //backgroundColor: Colors.white,
  );


  // flag true  => color gray and white
  // flag false => color silver and blue
  Widget buildNavBar() => Container(
    //color: Colors.indigo,
    margin: EdgeInsetsDirectional.all(8),
    height: 100,
    decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 249, 249, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey ,
          offset: Offset(0,2),
          blurRadius: 5,
          blurStyle: BlurStyle.solid
        ),
      ],
    ),
    child: Container(
      margin: const EdgeInsetsDirectional.only(
        top: 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIcons(Icons.add_box , "SERVICES", true) ,
                buildIcons(Icons.add , "CHAT", false) ,
                buildIcons(Icons.add , "ADDITION", true) ,
                buildIcons(Icons.add , "FAVORITE", false) ,
                buildIcons(Icons.add , "MY ACCOUNT", true) ,
              ],
            ),
          ),
        ],
      ),
    ),
  ) ;
  Widget buildIcons(IconData icon,String txt,bool flag) => Container(
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.grey
                ),
                color: flag ? Color.fromRGBO(241, 246, 251, 1) : Colors.black12,
              ),
              child:
                Icon(
                  icon ,
                  size: 35,
                  color: Colors.blue,
                ),
            ),
            onTap: (){

            },
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
              txt,
              style: const TextStyle(
              color: Color.fromRGBO(69, 166, 221, 1),
              fontWeight: FontWeight.bold,
              fontSize: 9,
            ),
          ),
        ],
      ),
    ) ;
  Widget buildItemView() => Container(
    margin: const EdgeInsetsDirectional.all(5),
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
                        Icons.bed_outlined,
                        color: Color.fromRGBO(69, 166, 221, 1),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '2' ,
                        style: TextStyle(
                            color: Color.fromRGBO(70, 83, 123, 1.0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold ,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ) ,
                      SizedBox(width: 10),
                      Icon(
                        Icons.ice_skating,
                        color: Color.fromRGBO(69, 166, 221, 1),
                        size: 25,
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