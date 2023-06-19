import 'package:flutter/material.dart';
import 'package:semsark/Repo/Api/islam_services/user_repo_api.dart';
import 'package:semsark/viewModels/profile_view_model.dart';


class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    viewModel.getUser();
  }
  final double profileHeight = 144;
  ProfileViewModel viewModel = ProfileViewModel(ApiUserRepo());
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
            "${viewModel.model!.name}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          "${viewModel.model!.email}",
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
    child: CircleAvatar(
      radius: 68,
      backgroundColor: Colors.white,
      child:  viewModel.model!.img == "string" ?
      const CircleAvatar(
        radius: 65,
        backgroundImage: AssetImage("assets/images/Mask.png"),
      ) :
      CircleAvatar(
        radius: 65,
        backgroundImage: NetworkImage(viewModel.model!.img),
      ),
    ),
  );
}