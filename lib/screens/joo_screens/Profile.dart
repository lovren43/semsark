import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent(){
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(26)),
        Text(
            'YOUSSEF',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        SizedBox(height: 5,),
        Text(
          'YOUSSEF@GMAIL.COM',
          style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
            letterSpacing: 5
          ),
        ),
        SizedBox(height: 100,),
        Container(
          width: 400,
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 246, 251, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              TextButton(
                  onPressed:(){},
                  child: Text(
                      'YOUR ADS',
                    style: TextStyle(
                      fontWeight: FontWeight.normal
                    ),
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: 60)),
              TextButton(
                  onPressed:(){},
                  child: Text(
                    'PAYMENTS',
                    style: TextStyle(
                        fontWeight: FontWeight.normal
                    ),
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: 60)),
              TextButton(
                  onPressed:(){},
                  child: Text(
                    'HISTORY',
                    style: TextStyle(
                        fontWeight: FontWeight.normal
                    ),
                  ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildTop() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          TopContainer(),
          Positioned(
              top: 175,
              child: ProfileImage()
          ),
        ],
    );
  }

  Widget TopContainer() => Container  (
    height: 270,
    decoration: const BoxDecoration(
        color: Color.fromRGBO(241, 246, 251, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(90.0),
          bottomLeft: Radius.circular(90.0),
        )
    ),
    child: Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          SizedBox(width: 15),
          IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(129, 137, 176, 1),
              )
          ),
          SizedBox(width: 120,),
          Text(
            'PROFILE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(129, 137, 176, 1),
            ),
          ),
          SizedBox(width: 100,),
          IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.settings,
                color: Color.fromRGBO(129, 137, 176, 1),
              )
          ),

        ],
      ),
    )
  );

  Widget ProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Color.fromRGBO(241, 246, 251, 1),
    child: const CircleAvatar(
      radius: 68,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 65,
        backgroundImage: AssetImage("assets/images/haha.JPG"),
      ),
    ),
  );
}