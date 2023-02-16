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
        children:[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent(){
    return Column(
      children: [
        //ProfileImage(),
        const Text(
            'YOUSSEF',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        const SizedBox(height: 5,),
        const Text(
          'YOUSSEF@GMAIL.COM',
          style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
            letterSpacing: 5
          ),
        ),
        const SizedBox(height: 100,),
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
        alignment: Alignment.bottomCenter,
        children: [
          TopContainer(),
          ProfileImage(),
        ],
    );
  }

  Widget TopContainer() => Column(
    children: [
      Container  (
        height: 270,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(241, 246, 251, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(90.0),
              bottomLeft: Radius.circular(90.0),
            )
        ),
        padding: EdgeInsets.only(left: 10 , right: 10),
        child: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.settings,
                    color: Color.fromRGBO(241, 246, 251, 1),
                  )
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(129, 137, 176, 1),
                    ),
                  ),
                ),
              ),
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
      ),
      const SizedBox(height: 70,)
    ],
  );

  Widget ProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Color.fromRGBO(241, 246, 251, 1),
    child: const CircleAvatar(
      radius: 68,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 65,
        backgroundImage: AssetImage("assets/images/hah.JPG"),
      ),
    ),
  );
}