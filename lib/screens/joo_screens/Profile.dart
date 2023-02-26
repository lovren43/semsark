import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/Api/islam_services/user_services.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    getUser();
    super.initState();
  }
  final double profileHeight = 144;
  String name = ' ' ;
  String email = ' ' ;
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
        Text(
            name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          email,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
            letterSpacing: 5
          ),
        ),
        const SizedBox(height: 100,),
        Container(
          width: 400,
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(241, 246, 251, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              TextButton(
                  onPressed:(){},
                  child: const Text(
                      'YOUR ADS',
                    style: TextStyle(
                      fontWeight: FontWeight.normal
                    ),
                  ),
              ),
              const Padding(padding: EdgeInsets.only(left: 60)),
              TextButton(
                  onPressed:(){},
                  child: const Text(
                    'PAYMENTS',
                    style: TextStyle(
                        fontWeight: FontWeight.normal
                    ),
                  ),
              ),
              const Padding(padding: EdgeInsets.only(left: 60)),
              TextButton(
                  onPressed:(){},
                  child: const Text(
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
  void getUser(){
    UserApi user = UserApi() ;
    user.getUser().then((value){
      print(value) ;
      setState(() {
        name = value['username'];
        email = value['email'];
      });
    }) ;
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
        padding: const EdgeInsets.only(left: 10 , right: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
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
    backgroundColor: const Color.fromRGBO(241, 246, 251, 1),
    child: const CircleAvatar(
      radius: 68,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 65,
        backgroundImage: AssetImage("assets/images/Mask.png"),
      ),
    ),
  );
}